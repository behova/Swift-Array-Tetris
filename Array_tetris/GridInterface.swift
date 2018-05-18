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
    var moveX = 0
    var moveY = 1
    var startX = 0
    var starty = 1
    
    func newShape() {
        moveX = 2
        moveY = 1
        startX = 1
        starty = 1
        
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
        for x in 0..<21 {
            for y in 0..<9 {
                if grid[x, y] == currentPiece[0][0] {
                    grid[x, y] = "0"
                }
            }
        }
    }
    
    func noCollision(Piece: [[String]]) -> Bool {
        for x in 0..<Piece.count {
            for y in 0..<Piece[x].count {
                if grid[(x + moveX), (y + moveY)]  == "9" {
                    return false
                }
                if grid[(x + moveX), (y + moveY)] == Piece[x][y] {
                    continue
                }
                if Piece[x][y] != "0" && grid[(x + moveX), (y + moveY)] != "0" {
                    return false
                }
            }
        }
        return true
    }
    
    func decend() {
        if noCollision(Piece: currentPiece) == true {
            clearCurrentShape()
            interface.drawShape()
            interface.moveX += 1
            interface.startX = interface.moveX
            
        }
       
     
    }
}


















