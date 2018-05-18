//
//  GameScene.swift
//  Array_tetris
//
//  Created by iMac on 5/13/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import SpriteKit

let interface = GridInterface()
var currentPiece = interface.currentPiece

class GameScene: SKScene {
    
    var y = 0.0
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .gray
        self.anchorPoint = CGPoint(x: 0.5, y: 0.95)
        
        
        interface.newShape()

        
    }
    
    func clear() {
        
        removeAllChildren()
        y = 0.0
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        
        clear()
        
        interface.decend()
        
        let printD = grid.returnDisplay(numColumns: 10)
        
        for row in 0...21  {
            
            let label = SKLabelNode(fontNamed: "AlNile")
            label.fontSize = 30.0
            label.zPosition = 10
            label.color = SKColor.white
            label.text = "\(printD[row])"
            //label.name = "row\(x)"
            label.position = CGPoint(x: 0.0, y: 0.0 - y)
            
            addChild(label)
            
            y += 30.0
        }
    }
}
