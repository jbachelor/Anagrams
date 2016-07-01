//
//  Config.swift
//  Anagrams
//
//  Created by Caroline on 1/08/2014.
//  Copyright (c) 2013 Underplot ltd. All rights reserved.
//

import Foundation
import UIKit

//UI Constants
let ScreenWidth = UIScreen.mainScreen().bounds.size.width
let ScreenHeight = UIScreen.mainScreen().bounds.size.height
let TileMargin: CGFloat = 20.0
let FontHUD = UIFont(name: "comic andy", size: 62.0)
let FontHUDBig = UIFont(name: "comic andy", size: 120.0)



//Random number generator
func randomNumber(minInclusive minInclusive: Int, maxExclusive: Int) -> Int {
    
    let uMin = UInt32(minInclusive)
    let uMax = UInt32(maxExclusive)
    let result = Int(arc4random_uniform(uMax - uMin) + uMin)
    
    logFn(file: #file, function: #function, message: "\(result)")
    
    return result
}


func logFn(file file: String, function: String, message: String = "") {
    
    var fileString = file.componentsSeparatedByString("/").last!
    fileString = fileString.componentsSeparatedByString(".").first!
    
    var logMessage = "\(fileString) --> \(function)"
    if !message.isEmpty {
        logMessage += ": \(message)"
    }
    
    print(logMessage)
    
}




