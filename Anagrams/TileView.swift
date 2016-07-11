//
//  TileView.swift
//  Anagrams
//
//  Created by Jon Bachelor on 6/24/16.
//  Copyright © 2016 Caroline. All rights reserved.
//

import UIKit


protocol TileDragDelegateProtocol {
    
    func tileView(tileView: TileView, didDragToPoint: CGPoint)
    
}


class TileView: UIImageView {
    
    let tileFont = "Verdana-Bold"
    let tileFontSize: CGFloat = 78.0
    var letter: Character
    var isMatched: Bool = false
    var dragDelegate: TileDragDelegateProtocol?
    
    private var xOffset: CGFloat = 0.0
    private var yOffset: CGFloat = 0.0
    private var tempTransform: CGAffineTransform = CGAffineTransformIdentity

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
        
        // Add a letter on top of tile
        let letterLabel = UILabel(frame: self.bounds)
        letterLabel.textAlignment = NSTextAlignment.Center
        letterLabel.textColor = UIColor.whiteColor()
        letterLabel.backgroundColor = UIColor.clearColor()
        letterLabel.text = String(letter).uppercaseString
        letterLabel.font = UIFont(name: tileFont, size: tileFontSize * scale)
        self.addSubview(letterLabel)
        self.userInteractionEnabled = true
        
        // Create tile shadow
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOpacity = 0
        self.layer.shadowOffset = CGSizeMake(10.0, 10.0)
        self.layer.shadowRadius = 15.0
        self.layer.masksToBounds = false
        
        let path = UIBezierPath(rect: self.bounds)
        self.layer.shadowPath = path.CGPath
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
            self.layer.shadowOpacity = 0.8
            
            // save current transform
            tempTransform = self.transform
            // enlarge the tile
            self.transform = CGAffineTransformScale(self.transform, 1.2, 1.2)
            self.superview?.bringSubviewToFront(self)
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
        self.transform = tempTransform
        dragDelegate?.tileView(self, didDragToPoint: self.center)
        self.layer.shadowOpacity = 0.0
    }
    
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        self.transform = tempTransform
        self.layer.shadowOpacity = 0.0
    }
    
}























