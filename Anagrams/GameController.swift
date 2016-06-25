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
        
        tiles = []
        
        for (index, letter) in anagramPair.anagram1.characters.enumerate() {
            if letter == " " {
                continue
            }
            
            let tile = TileView(letter: letter, sideLength: tileSide)
            tile.center = CGPointMake(xOffset + CGFloat(index) * (tileSide + TileMargin), ScreenHeight/4*3)
            
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





















