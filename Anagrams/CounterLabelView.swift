//
//  CounterLabelView.swift
//  Anagrams
//
//  Created by Jon Bachelor on 7/1/16.
//  Copyright © 2016 Caroline. All rights reserved.
//

import UIKit

class CounterLabelView: UILabel {
    
    var value: Int = 0 {
        didSet {
            self.text = " \(value)"
        }
    }
    
    
    required init(coder aCoder: NSCoder) {
        fatalError("Never use... Please use init(font:frame:)")
    }
    
    
    init(font: UIFont, frame: CGRect) {
        super.init(frame: frame)
        self.font = font
        self.backgroundColor = UIColor.clearColor()
    }
}
