//
//  Shapes.swift
//  Array_tetris
//
//  Created by iMac on 5/13/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import Foundation

struct ShapeArrays {
    
    let TBlock: [[String]] = [
        ["1","1","1","0"],
        ["0","1","0","0"],
        ["0","0","0","0"],
        ["0","0","0","0"]
    ]
    
    let jBlock: [[String]] = [
        ["2","2","2","0"],
        ["0","0","2","0"],
        ["0","0","0","0"],
        ["0","0","0","0"]
    ]
    
    let lBlock: [[String]] = [
        ["3","0","3","0"],
        ["3","3","3","0"],
        ["0","0","0","0"],
        ["0","0","0","0"]
    ]
    
    
    func randomShape() -> [[String]] {
        let randomNum = arc4random_uniform(3)
        
        switch randomNum {
        case 0: return TBlock
        case 1: return lBlock
        case 2: return jBlock
        default:
            return TBlock
        }
    }
    
}
