//
//  ExplodeView.swift
//  Anagrams
//
//  Created by Jon Bachelor on 7/7/16.
//  Copyright © 2016 Caroline. All rights reserved.
//

import UIKit

class ExplodeView: UIView {
    
    private var emitter: CAEmitterLayer!
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("Never use this init. Use init(frame:)")
    }
    
    
    func disableEmitterCell() {
        emitter.setValue(0, forKey: "emitterCells.cell.birthRate")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        logFn(file: #file, function: #function)
        
        emitter = self.layer as! CAEmitterLayer
        emitter.emitterPosition = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)
        emitter.emitterSize = self.bounds.size
        emitter.emitterMode = kCAEmitterLayerAdditive
        emitter.emitterShape = kCAEmitterLayerRectangle
    }
    
    
    override class func layerClass() -> AnyClass {
        logFn(file: #file, function: #function)
        return CAEmitterLayer.self
    }
    
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        logFn(file: #file, function: #function)
        
        if self.superview == nil {
            return
        }
        
        let texture: UIImage? = UIImage(named: "particle")
        assert(texture != nil, "Particle image not found")
        
        let emitterCell = CAEmitterCell()
        emitterCell.contents = texture!.CGImage
        emitterCell.name = "cell"
        emitterCell.birthRate = 1000
        emitterCell.lifetime = 0.75
        emitterCell.blueRange = 0.33
        emitterCell.blueSpeed = -0.33
        emitterCell.velocity = 160
        emitterCell.velocityRange = 40
        emitterCell.scaleRange = 0.5
        emitterCell.scaleSpeed = -0.2
        emitterCell.emissionRange = CGFloat(M_PI*2)
        emitterCell.emitterCells = [emitterCell]
        
        var delay = Int64(0.1 * Double(NSEC_PER_SEC))
        var delayTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.disableEmitterCell()
        }
        
        delay = Int64(2 * Double(NSEC_PER_SEC))
        delayTime = dispatch_time(DISPATCH_TIME_NOW, delay)
        dispatch_after(delayTime, dispatch_get_main_queue()) {
            self.removeFromSuperview()
        }
    }
}





























