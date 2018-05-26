//
//  Shapes.swift
//  Array_tetris
//
//  Created by iMac on 5/13/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import Foundation

var currentShape = [[String]]()

struct ShapeArrays {
    
    
    let tBlock: [[String]] = [
        ["0","0","1","0"],
        ["0","1","1","0"],
        ["0","0","1","0"],
        ["0","0","0","0"]
        
    ]
    
    let lBlock: [[String]] = [
        ["0","0","0","0"],
        ["0","2","2","0"],
        ["0","0","2","0"],
        ["0","0","2","0"]
        
    ]
    
    let jBlock: [[String]] = [
        ["0","0","0","0"],
        ["0","3","3","0"],
        ["0","3","0","0"],
        ["0","3","0","0"]
    ]
    
    let iBlock: [[String]] = [
        ["0","0","4","0"],
        ["0","0","4","0"],
        ["0","0","4","0"],
        ["0","0","4","0"]
    
    ]
    
    let oBlock: [[String]] = [
        ["0","0","0","0"],
        ["0","5","5","0"],
        ["0","5","5","0"],
        ["0","0","0","0"],
    ]
    
    let zBlock: [[String]] = [
        ["0","0","6","0"],
        ["0","6","6","0"],
        ["0","6","0","0"],
        ["0","0","0","0"]
        
    ]
    
    let sBlock: [[String]] = [
        ["0","7","0","0"],
        ["0","7","7","0"],
        ["0","0","7","0"],
        ["0","0","0","0"]
        
    ]
    
    
    func randomShape() -> [[String]] {
        let randomNum = arc4random_uniform(7)
        
        switch randomNum {
        case 0: return tBlock
        case 1: return lBlock
        case 2: return jBlock
        case 3: return iBlock
        case 4: return oBlock
        case 5: return sBlock
        case 6: return zBlock
        default:
            return tBlock
        }
    }
    func newRandomShape() {
        currentShape = randomShape()
        
    }
    
    func currentshapeIndex(x: Int, y: Int, r: Int) -> String {
        let flatt = currentShape.reduce([], +)
        
        switch r {
        case 0: return flatt[y * 4 + x]
        case 1: return flatt[12 + y - (x * 4)]
        case 2: return flatt[15 - (y * 4) - x]
        case 3: return flatt[3 - y + (x * 4)]
            
        default:
            return flatt[y * 4 + x]
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
