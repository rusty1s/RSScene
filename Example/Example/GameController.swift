//
//  GameController.swift
//  Example
//
//  Created by Matthias Fey on 28.07.15.
//  Copyright © 2015 Matthias Fey. All rights reserved.
//

import UIKit
import SpriteKit

class GameController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = self.view as! SKView
        let scene = GameScene(size: view.bounds.size)
        
        skView.showsFPS = true
        scene.showsTPS = true
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}

