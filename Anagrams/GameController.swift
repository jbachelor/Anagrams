//
//  GameController.swift
//  Anagrams
//
//  Created by Jon Bachelor on 6/24/16.
//  Copyright © 2016 Caroline. All rights reserved.
//

import UIKit

class GameController {
    
    var gameView: UIView!
    var level: Level!
    var hud: HUDView!
    
    private var tiles = [TileView]()
    private var targets = [TargetView]()
    private var secondsLeft: Int = 0
    private var timer: NSTimer?
    private var data = GameData()
    private var audioController: AudioController
    
    
    init() {
        self.audioController = AudioController()
        self.audioController.preloadAudioEffects(AudioEffectFiles)
    }
    
    
    func dealRandomAnagram() {
        logFn(file: #file, function: #function)
        
        let anagramPair = getAnagramPair()
        
        let anagram1Length = anagramPair.anagram1.characters.count
        let anagram2Length = anagramPair.anagram2.characters.count
        
        // calculate tile size
        let tileSide = ceil(ScreenWidth * 0.9 / CGFloat(max(anagram1Length, anagram2Length))) - TileMargin
        
        // Get the left margin for first tile
        var xOffset = (ScreenWidth - CGFloat(max(anagram1Length, anagram2Length)) * (tileSide + TileMargin)) / 2.0
        
        // adjust for tile center, instead of the tile's origin
        xOffset += tileSide / 2.0
        
        // Initialize target list
        targets = []
        
        // create targets
        for (index, letter) in anagramPair.anagram2.characters.enumerate() {
            if letter == " " {
                continue
            }
            
            let target = TargetView(letter: letter, sideLength: tileSide)
            target.center = CGPointMake(xOffset + CGFloat(index) * (tileSide + TileMargin), ScreenHeight/4)
            
            gameView.addSubview(target)
            targets.append(target)
        }
        
        // Initialize tile list
        tiles = []
        
        for (index, letter) in anagramPair.anagram1.characters.enumerate() {
            if letter == " " {
                continue
            }
            
            let tile = TileView(letter: letter, sideLength: tileSide)
            tile.center = CGPointMake(xOffset + CGFloat(index) * (tileSide + TileMargin), ScreenHeight/4*3)
            
            // make that tile look a little askew for the funky-chicken!
            tile.randomizeTileLayout()
            tile.dragDelegate = self
            
            gameView.addSubview(tile)
            tiles.append(tile)
        }
        
        // start game timer
        self.startStopwatch()
    }
    
    
    func placeTile(tileView: TileView, targetView: TargetView) {
        targetView.isMatched = true
        tileView.isMatched = true
        
        tileView.userInteractionEnabled = false
        
        UIView.animateWithDuration(0.35, delay: 0.00, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            tileView.center = targetView.center
            tileView.transform = CGAffineTransformIdentity
            }, completion: {
                (value: Bool) in
                targetView.hidden = true
        })
    }
    
    
    func checkForSuccess() {
        for targetView in targets {
            if !targetView.isMatched {
                return
            }
        }
        print("Game over... You win! (((don't tell Dustin!)))")
        self.stopStopwatch()
        audioController.playEffect(SoundWin)
    }
    
    
    func startStopwatch() {
        secondsLeft = level.timeToSolve
        hud.stopwatch.setSecondsRemaining(secondsLeft)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0,
                                                       target: self,
                                                       selector: #selector(GameController.tick(_:)),
                                                       userInfo: nil,
                                                       repeats: true)
    }
    
    
    func stopStopwatch() {
        timer?.invalidate()
        timer = nil
    }
    
    
    @objc func tick(timer: NSTimer) {
        secondsLeft -= 1
        hud.stopwatch.setSecondsRemaining(secondsLeft)
        if secondsLeft == 0 {
            self.stopStopwatch()
        }
    }
    
    
    private func getAnagramPair() -> (anagram1: String, anagram2: String) {
        logFn(file: #file, function: #function)
        
        assert(level.anagrams.count > 0, "Oh noes! No level loaded!")
        
        let randomIndex = randomNumber(minInclusive: 0, maxExclusive: level.anagrams.count)
        let anagramPair = level.anagrams[randomIndex]
        
        let anagram1 = anagramPair[0] as! String
        let anagram2 = anagramPair[1] as! String
        
        print("phrase1[\(anagram1.characters.count)]:  \(anagram1)")
        print("phrase2[\(anagram2.characters.count)]:  \(anagram2)")
        
        return(anagram1, anagram2)
    }
    
}



extension GameController: TileDragDelegateProtocol {
    
    func tileView(tileView: TileView, didDragToPoint point: CGPoint) {
        logFn(file: #file, function: #function)
        
        var targetView: TargetView?
        
        for tView in targets {
            if tView.frame.contains(point) && !tView.isMatched {
                targetView = tView
                break
            }
        }
        
        if let targetView = targetView {
            if targetView.letter == tileView.letter {
                print("Successful tile placement!")
                audioController.playEffect(SoundDing)
                self.placeTile(tileView, targetView: targetView)
                data.points += level.pointsPerTile
                hud.gamePoints.setValue(data.points, duration: 0.5)
                self.checkForSuccess()
            } else {
                print("Failure... Let the player know this tile does not belong here")
                audioController.playEffect(SoundWrong)
                tileView.randomizeTileLayout()
                UIView.animateWithDuration(0.35, delay: 0.00,
                                           options: UIViewAnimationOptions.CurveEaseOut,
                                           animations: {
                                            tileView.center = CGPointMake(tileView.center.x + CGFloat(randomNumber(minInclusive: 0, maxExclusive: 41) - 20),
                                            tileView.center.y + CGFloat(randomNumber(minInclusive: 20, maxExclusive: 31)))
                    }, completion: nil)
                data.points -= level.pointsPerTile/2
                hud.gamePoints.setValue(data.points, duration: 0.25)
            }                        
        } else {
            print("Tile dropped, but not on a target.")
        }
    }
    
}





















