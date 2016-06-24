//
//  Level.swift
//  Anagrams
//
//  Created by Jon Bachelor on 6/24/16.
//  Copyright © 2016 Caroline. All rights reserved.
//

import Foundation

struct Level {
    let pointsPerTile: Int
    let timeToSolve: Int
    let anagrams: [NSArray]
    
    
    init(levelNumber: Int) {
        // Find plist file for this level
        let fileName = "level\(levelNumber).plist"
        let levelPath = "\(NSBundle.mainBundle().resourcePath!)/\(fileName)"
        
        // load plist file
        let levelDictionary: NSDictionary? = NSDictionary(contentsOfFile: levelPath)
        assert(levelDictionary != nil, "Level configuration file not found.")
        
        // Initialize object from dictionary
        self.pointsPerTile = levelDictionary!["pointsPerTile"] as! Int
        self.timeToSolve = levelDictionary!["timeToSolve"] as! Int
        self.anagrams = levelDictionary!["anagrams"] as! [NSArray]
    }
}