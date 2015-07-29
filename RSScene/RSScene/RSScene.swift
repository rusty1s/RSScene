//
//  RSScene.swift
//  RSScene
//
//  Created by Matthias Fey on 28.07.15.
//  Copyright © 2015 Matthias Fey. All rights reserved.
//

import SpriteKit

/// `RSScene` inherits from a `SKScene` object, which represents a scene
/// of content in Sprite Kit. A `RSScene` extends the animation loop by
/// adding a logic loop with its own interval.
public class RSScene : SKScene {
    
    // MARK: Instance variables
    
    /// The amount of times the game logic is called per second.  The
    /// default value is 30 ticks per seconds.
    public var tps: Int {
        set {
            _tps = max(0, newValue)
            countPerSecond = 0
        }
        get { return _tps }
    }
    private var _tps: Int = 30
    
    /// The quality of service you want to give to the logic loop
    /// executed in the global queue.
    public var priority: qos_class_t = QOS_CLASS_BACKGROUND
    
    /// A delegate to be called during the logic loop. When the delegate
    /// is present, your delegate is called instead of the corresponding
    /// method on the scene object.
    public var logicDelegate: RSSceneDelegate?
    
    // MARK: Helper instance variables
    
    private var inGameLogic: Bool = false
    
    private var countPerSecond: Int = 0
    
    private var startTimeInterval: NSTimeInterval = 0
    
    private var currentTime: NSTimeInterval = 0
    
    // MARK: Executing the Game Logic Loop
    
    /// Performs any game-logic-specific updates.
    public func updateGameLogic(currentTime: NSTimeInterval) {}
    
    // MARK: Executing the Animation Loop
    
    /// Performs any scene-specific updates that need to occur before
    /// scene actions are evaluated.  Note that when you override this
    /// method, you need to call its super method.
    public override func update(currentTime: NSTimeInterval) {
        
        // save the current time in a local variable
        self.currentTime = currentTime
        
        // setup the start time interval, if not set yet
        if startTimeInterval == 0 { startTimeInterval = currentTime }
        
        // wait for the execution of the game logic to finish
        if !inGameLogic && tps > 0 {
            
            // wait for the game logic interval to pass the tps
            if currentTime - startTimeInterval > Double(countPerSecond)*(1.0/Double(tps)) {
            
                // execute the game logic
                inGameLogic = true
                dispatch_async(dispatch_get_global_queue(priority, 0)) {
                    if self.logicDelegate != nil {
                        self.logicDelegate?.updateGameLogic(self.currentTime, forScene: self)
                    }
                    else {
                        self.updateGameLogic(self.currentTime)
                    }
                    
                    self.countPerSecond++
                    // if a second has passed, reset local variables
                    if self.currentTime > 1.0+self.startTimeInterval {
                        self.countPerSecond = 0
                        self.startTimeInterval = self.currentTime
                    }
                    
                    self.inGameLogic = false
                }
            }
        }
    }
}
