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
        logFn(file: #file, function: #function)
        
        gameController = GameController()
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logFn(file: #file, function: #function)
        
        let level1 = Level(levelNumber: 1)
        // Add one layer for all game elements:
        let gameView = UIView(frame: CGRectMake(0, 0, ScreenWidth, ScreenHeight))
        self.view.addSubview(gameView)
        gameController.gameView = gameView
        
        // add one view for all HUD and controls
        let hudView = HUDView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight))
        self.view.addSubview(hudView)
        gameController.hud = hudView
        
        gameController.level = level1
        gameController.dealRandomAnagram()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        logFn(file: #file, function: #function)
    }
    
    
    override func prefersStatusBarHidden() -> Bool {
        logFn(file: #file, function: #function)
        
        return true
    }
    
}

