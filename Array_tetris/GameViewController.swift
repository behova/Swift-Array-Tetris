//
//  GameViewController.swift
//  Array_tetris
//
//  Created by iMac on 5/13/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import SpriteKit
import UIKit

class GameViewController: UIViewController {
    
    let skView: SKView = {
        let view = SKView()
        view.preferredFramesPerSecond = 1
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(skView)
        skView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 30.0, left: 30.0, bottom: 30.0, right: 30.0))
        
        
        let mainScene = GameScene(size: view.frame.size)
        mainScene.scaleMode = .aspectFit
        
        skView.presentScene(mainScene)
    }
}

