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
    
    
    init() { }
    
    
    func dealRandomAnagram() {
        print("\(#file.componentsSeparatedByString("/").last!) --> \(#function)")
        
        let anagramPair = getAnagramPair()        
    }
    
    
    private func getAnagramPair() -> (anagram1: String, anagram2: String) {
        print("\(#file.componentsSeparatedByString("/").last!) --> \(#function)")
        
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





















