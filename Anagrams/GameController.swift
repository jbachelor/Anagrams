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
    
    private var tiles = [TileView]()
    private var targets = [TargetView]()
    
    
    init() { }
    
    
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
        var targetView: TargetView?
        for tv in targets {
            if tv.frame.contains(point) && !tv.isMatched {
                targetView = tv
                break
            }
        }
        
        if let targetView = targetView {
            if targetView.letter == tileView.letter {
                print("Success! You should place the tile here!")
                // todo: More success stuff
                print("Check if the player has completed the phrase")
            } else {
                print("Failure... Let the player know this tile does not belong here")
                // todo: More failure stuff
            }
        } else {
            print("Tile dropped, but not on a target.")
        }
    }
    
}





















