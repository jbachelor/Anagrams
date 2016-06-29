//
//  TileView.swift
//  Anagrams
//
//  Created by Jon Bachelor on 6/24/16.
//  Copyright © 2016 Caroline. All rights reserved.
//

import UIKit

class TileView: UIImageView {
    
    var letter: Character
    var isMatched: Bool = false
    
    private var xOffset: CGFloat = 0.0
    private var yOffset: CGFloat = 0.0

    required init(coder aDecoder: NSCoder) {
        fatalError("This initializer should never be called! Please use init(letter:sideLength:")
    }
    
    init(letter: Character, sideLength: CGFloat) {
        logFn(file: #file, function: #function)
        
        self.letter = letter
        let image = UIImage(named: "tile")!
        super.init(image: image)
        
        // resize tile
        let scale = sideLength / image.size.width
        self.frame = CGRect(x: 0, y: 0, width: image.size.width * scale, height: image.size.height * scale)
        
        // Add a letter on top
        let letterLabel = UILabel(frame: self.bounds)
        letterLabel.textAlignment = NSTextAlignment.Center
        letterLabel.textColor = UIColor.whiteColor()
        letterLabel.backgroundColor = UIColor.clearColor()
        letterLabel.text = String(letter).uppercaseString
        letterLabel.font = UIFont(name: "Verdana-Bold", size: 78.0 * scale)
        self.addSubview(letterLabel)
        self.userInteractionEnabled = true
    }
    
    
    func randomizeTileLayout() {
        logFn(file: #file, function: #function)
        
        // randomize angle of placement
        let rotation = CGFloat(randomNumber(minInclusive: 0, maxExclusive: 51)) / 100.0 - 0.2
        self.transform = CGAffineTransformMakeRotation(rotation)
        
        // randomly move up just a bit
        let yOffset = CGFloat(randomNumber(minInclusive: 0, maxExclusive: 11) - 11)
        self.center = CGPointMake(self.center.x, self.center.y + yOffset)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // todo: Is there a safer way to do this without the force unwrap?
        if let touch = touches.first! as? UITouch {
            let point = touch.locationInView(self.superview)
            xOffset = point.x - self.center.x
            yOffset = point.y - self.center.y
        }
    }
    
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        // todo: Is there a safer way to do this without the force unwrap?
        if let touch = touches.first! as? UITouch {
            let point = touch.locationInView(self.superview)
            self.center = CGPointMake(point.x - xOffset, point.y - yOffset)
        }
    }
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.touchesMoved(touches, withEvent: event)
    }
    
}























