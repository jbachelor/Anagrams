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



//Random number generator
func randomNumber(minInclusive minInclusive: Int, maxExclusive: Int) -> Int {
    let uMin = UInt32(minInclusive)
    let uMax = UInt32(maxExclusive)
    let result = Int(arc4random_uniform(uMax - uMin) + uMin)
    return result
}



