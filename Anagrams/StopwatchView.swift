//
//  StopwatchView.swift
//  Anagrams
//
//  Created by Jon Bachelor on 6/30/16.
//  Copyright © 2016 Caroline. All rights reserved.
//

import UIKit

class StopwatchView: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        fatalError("Nope... Don't use this initializer. Please use init(frame:)")
    }
    
    override init(frame: CGRect) {
        logFn(file: #file, function: #function)
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
        self.font = FontHUDBig
    }
    
    
    func setSecondsRemaining(secondsLeft:Int) {
        self.text = String(format: "%02i : %02i", secondsLeft/60, secondsLeft%60)
    }
}
























