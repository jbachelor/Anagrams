//
//  HUDView.swift
//  Anagrams
//
//  Created by Jon Bachelor on 6/30/16.
//  Copyright © 2016 Caroline. All rights reserved.
//

import UIKit

class HUDView: UIView {
    var stopwatch: StopwatchView
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("Never call this... Use init(frame:)")
    }
    
    
    override init(frame: CGRect) {
        self.stopwatch = StopwatchView(frame: CGRectMake(ScreenWidth/2 - 150, 0, 300, 100))
        self.stopwatch.setSecondsRemaining(0)
        
        super.init(frame: frame)
        self.userInteractionEnabled = false
        self.addSubview(self.stopwatch)
    }
}



















