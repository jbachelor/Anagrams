//
//  TargetView.swift
//  Anagrams
//
//  Created by Jon Bachelor on 6/24/16.
//  Copyright © 2016 Caroline. All rights reserved.
//

import UIKit

class TargetView: UIImageView {
    
    var letter: Character
    var isMatched: Bool = false
    
    required init(coder aDecoder: NSCoder) {
        fatalError("WHAT did I say about calling this method?? Never!")
    }
    
    init(letter: Character, sideLength: CGFloat) {
        logFn(file: #file, function: #function)
        self.letter = letter
        
        let image = UIImage(named: "slot")!
        super.init(image: image)
        
        let scale = sideLength / image.size.width
        self.frame = CGRectMake(0, 0, image.size.width * scale, image.size.height * scale)
    }
}




























