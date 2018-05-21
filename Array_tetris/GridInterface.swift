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
var collisonCount = Int()
//var currentPiece = [[String]]()
var currentRotation = 0
var startX = Int()
var starty = Int()

class GridInterface {
    
    func newShape() {
        collisonCount = 0
        startX = 0
        starty = 2
        
        shapes.newRandomShape()
        
        //currentPiece = shape
        
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
    
    func clearPrevious() {
        for x in 0..<currentPiece.count {
            for y in 0..<currentPiece[x].count {
                if currentPiece[x][y] != "0" {
                    grid[x + startX - 1, y + starty] = "0"
                }
            }
        }
    }
    
    func clearCurrentShape(number: String = "0") {
        let flatt = currentPiece.joined()
        if let value = flatt.first(where: { $0 > "0"}) {
            for x in 0..<22 {
                for y in 0..<10 {
                    if grid[x, y] == value {
                        grid[x, y] = number
                    }
                }
            }
        }
    }
    
    func noCollision(piece: [[String]]) -> Bool {
        var hits = [
            [0,0,0,0],
            [0,0,0,0],
            [0,0,0,0],
            [0,0,0,0]
        ]

        for x in 0..<piece.count {
            for y in 0..<piece[x].count {
                if piece[x][y] == "0" {
                    continue
                }
                else if grid[(x + startX), (y + starty)] == piece[x][y] {
                    hits[x][y] += -1
                }
                else if grid[(x + startX), (y + starty)] > "0" {
                    hits[x][y] += 1
                }
                else {
                    continue
                }
            }
        }
        print(hits)
        let flatt = hits.joined()
        if flatt.contains(1) {
            return false
        } else {
           return true
        }
    }
    
    func decend() {
        startX += 1
        if noCollision(piece: currentPiece) == true {
            
            print(startX)
            //clearCurrentShape()
            clearPrevious()
            interface.drawShape()
            
        } else if noCollision(piece: currentPiece) == false {
            couldntDecend()
            startX += -1
        }
    }
    func couldntDecend() {
       collisonCount += 1
    }
    
    
    
    
}


















