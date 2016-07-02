//
//  GameData.swift
//  Anagrams
//
//  Created by Jon Bachelor on 6/30/16.
//  Copyright © 2016 Caroline. All rights reserved.
//

import Foundation

class GameData {
    
    var points: Int = 0 {
        didSet {
            logFn(file: #file, function: #function, message: "Set points to: \(points).")
            points = max(points, 0)
        }
    }
}

























