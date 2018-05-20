//
//  GridInterface.swift
//  Array_tetris
//
//  Created by iMac on 5/14/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import SpriteKit

var grid = Matrix(rows: 22, columns: 10)
let shapes = ShapeArrays()

class GridInterface {
    
    var currentPiece = [[String]]()
    var currentRotation = 0
    var startX = Int()
    var starty = Int()
    
    func newShape() {
        startX = 0
        starty = 3
        
        let shape = shapes.randomShape()
        currentPiece = shape
        
        for x in 0..<currentPiece.count {
            for y in 0..<currentPiece[x].count {
                if currentPiece[x][y] != "0" {
                    grid[x + startX, y + starty] = currentPiece[x][y]
                }
            }
        }
    }
    
    
    func drawShape() {
        for x in 0..<currentPiece.count {
            for y in 0..<currentPiece[x].count {
                if currentPiece[x][y] != "0" {
                    grid[x + startX, y + starty] = currentPiece[x][y]
                }
            }
        }
    }
    
    func clearCurrentShape() {
        let flatt = currentPiece.joined()
        if let value = flatt.first(where: { $0 > "0"}) {
            for x in 0..<22 {
                for y in 0..<10 {
                    if grid[x, y] == value {
                        grid[x, y] = "0"
                    }
                }
            }
        }
    }
        
    
    func noCollision(piece: [[String]]) -> Bool {
        for x in 0..<piece.count {
            for y in 0..<piece.count {
                if piece[x][y] > "0" {
                    if grid[(x + startX) + 1, (y + starty) + 1] != piece[x][y] && grid[(x + startX) + 1, (y + starty) + 1] > "0"  {
                        return false
                    }
                }
            }
        }
       return true
    }
    
    func decend() {
        if noCollision(piece: currentPiece) == true {
//            interface.moveX += 1
//            interface.startX = interface.moveX
            interface.startX += 1
            clearCurrentShape()
            interface.drawShape()
            
            
        }
       
     
    }
}


















