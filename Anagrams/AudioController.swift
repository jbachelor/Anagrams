//
//  AudioController.swift
//  Anagrams
//
//  Created by Jon Bachelor on 7/7/16.
//  Copyright © 2016 Caroline. All rights reserved.
//

import AVFoundation

class AudioController {
    
    private var audio = [String:AVAudioPlayer]()
    
    
    func preloadAudioEffects(effectFileNames:[String]) {
        for effect in AudioEffectFiles {
            let soundPath = "\(NSBundle.mainBundle().resourcePath!)/\(effect)"
            let soundURL = NSURL.fileURLWithPath(soundPath)
            
            do {
                let player = try AVAudioPlayer(contentsOfURL: soundURL)
                player.numberOfLoops = 0
                player.prepareToPlay()
                
                audio[effect] = player
                
            } catch {
                print("Load sound failed")
            }
        }
    }
    
    
    func playEffect(name: String) {
        if let player = audio[name] {
            if player.playing {
                player.currentTime = 0
            } else {
                player.play()
            }
        }
    }
}



































