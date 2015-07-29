//
//  GameScene.swift
//  Example
//
//  Created by Matthias Fey on 29.07.15.
//  Copyright © 2015 Matthias Fey. All rights reserved.
//

import SpriteKit
import RSScene

class GameScene : RSScene {
    
    // MARK: Setup
    
    override func didMoveToView(view: SKView) {
        self.tps = 10
    }
    
    // MARK: Executing the Game Logic Loop
    
    override func updateGameLogic(currentTime: NSTimeInterval) {
        print("logic")
    }
    
    // MARK: Executing the Animation Loop
    
    override func update(currentTime: NSTimeInterval) {
        print("animation")
        super.update(currentTime)
    }
}
