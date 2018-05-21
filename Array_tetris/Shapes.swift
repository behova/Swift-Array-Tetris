//
//  Shapes.swift
//  Array_tetris
//
//  Created by iMac on 5/13/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import Foundation

struct ShapeArrays {
    
    let tBlock: [[String]] = [
        ["1","1","1","0"],
        ["0","1","0","0"],
        ["0","0","0","0"],
        ["0","0","0","0"]
        
    ]
    
    let lBlock: [[String]] = [
        ["2","2","2","0"],
        ["2","0","0","0"],
        ["0","0","0","0"],
        ["0","0","0","0"]
        
    ]
    
    let jBlock: [[String]] = [
        ["3","0","0","0"],
        ["3","3","3","0"],
        ["0","0","0","0"],
        ["0","0","0","0"]
    ]
    let iBlock: [[String]] = [
        ["0","0","0","0"],
        ["4","4","4","4"],
        ["0","0","0","0"],
        ["0","0","0","0"]
    
    ]
    let oBlock: [[String]] = [
        ["0","5","5","0"],
        ["0","5","5","0"],
        ["0","0","0","0"],
        ["0","0","0","0"],
    ]
    let zBlock: [[String]] = [
        ["6","6","0","0"],
        ["0","6","6","0"],
        ["0","0","0","0"],
        ["0","0","0","0"]
        
    ]
    let sBlock: [[String]] = [
        ["0","7","7","0"],
        ["7","7","0","0"],
        ["0","0","0","0"],
        ["0","0","0","0"]
        
    ]
    
    
    func randomShape() -> [[String]] {
        let randomNum = arc4random_uniform(8)
        
        switch randomNum {
        case 0: return tBlock
        case 1: return lBlock
        case 2: return jBlock
        case 3: return lBlock
        case 4: return iBlock
        case 5: return oBlock
        case 6: return sBlock
        case 7: return zBlock
        default:
            return tBlock
        }
    }
    
}
