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

    required init(coder aDecoder: NSCoder) {
        fatalError("This initializer should never be called. Please use init(letter:sideLength:")
    }
    
    init(letter: Character, sideLength: CGFloat) {
        self.letter = letter
        let image = UIImage(named: "tile")!
        super.init(image: image)
        
        // resize tile
        let scale = sideLength / image.size.width
        self.frame = CGRect(x: 0, y: 0, width: image.size.width * scale, height: image.size.height * scale)
    }
    
}























