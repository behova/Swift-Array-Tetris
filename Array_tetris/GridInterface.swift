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
var currentRotation = 0
var startX = Int()
var starty = Int()

class GridInterface {
    
    func newShape() {
        collisonCount = 0
        startX = 0
        starty = 2
        
        shapes.newRandomShape()
        
        for x in 0..<currentShape.count {
            for y in 0..<currentShape[x].count {
                if shapes.currentshapeIndex(x: x, y: y, r: currentRotation) != "0" {
                    grid[x + startX, y + starty] = shapes.currentshapeIndex(x: x, y: y, r: currentRotation)
                }
            }
        }
    }
    
    
    func drawShape() {
        for x in 0..<currentShape.count {
            for y in 0..<currentShape[x].count {
                if shapes.currentshapeIndex(x: x, y: y, r: currentRotation) != "0" {
                    grid[x + startX, y + starty] = shapes.currentshapeIndex(x: x, y: y, r: currentRotation)
                }
            }
        }
    }
    
    func clearCurrentShape(number: String = "0") {
        let flatt = currentShape.joined()
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
    func convertShape() {
        for x in 0..<currentShape.count {
            for y in 0..<currentShape[x].count {
                if shapes.currentshapeIndex(x: x, y: y, r: currentRotation) != "0" {
                    grid[x + startX - 1, y + starty] = "8"
                }
            }
        }
    }
    ////////// logic
    
    func noCollision(piece: [[String]]) -> Bool {
        var hits = [
            [0,0,0,0],
            [0,0,0,0],
            [0,0,0,0],
            [0,0,0,0]
        ]

        for x in 0..<piece.count {
            for y in 0..<piece[x].count {
                if shapes.currentshapeIndex(x: x, y: y, r: currentRotation) == "0" {
                    continue
                }
                else if grid[(x + startX), (y + starty)] == shapes.currentshapeIndex(x: x, y: y, r: currentRotation) {
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
        //print(hits)
        let flatt = hits.joined()
        if flatt.contains(1) {
            return false
        } else {
           return true
        }
    }
    
    func decend() {
        startX += 1
        
        if noCollision(piece: currentShape) == true {
            
            clearCurrentShape()
            
            interface.drawShape()
            
            
        } else if noCollision(piece: currentShape) == false {
            couldntDecend()
            startX += -1
        }
    }
    
    func couldntDecend() {
        if collisonCount >= 1 {
            convertShape()
            newShape()
        }
       collisonCount += 1
        
    }
    
    
    
    
}


















