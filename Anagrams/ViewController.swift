//
//  ViewController.swift
//  Anagrams
//
//  Created by Caroline on 1/08/2014.
//  Copyright (c) 2014 Caroline. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let gameController: GameController
    
    
    required init?(coder aDecoder: NSCoder) {
        print("\(#file.componentsSeparatedByString("/").last!) --> \(#function)")
        
        gameController = GameController()
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(#file.componentsSeparatedByString("/").last!) --> \(#function)")
        
        let level1 = Level(levelNumber: 1)
        // Add one layer for all game elements:
        let gameView = UIView(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight))
        self.view.addSubview(gameView)
        gameController.gameView = gameView
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        print("\(#file.componentsSeparatedByString("/").last!) --> \(#function)")
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        print("\(#file.componentsSeparatedByString("/").last!) --> \(#function)")
        
        return true
    }
    
}

