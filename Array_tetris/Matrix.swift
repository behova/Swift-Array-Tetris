//
//  Matrix.swift
//  Array_tetris
//
//  Created by iMac on 5/13/18.
//  Copyright © 2018 HipsterTrikster. All rights reserved.
//

import Foundation

struct Matrix {
    let rows: Int, columns: Int
    var grid: [String]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(repeating: "0", count: rows * columns)
        //Create Border
        for x in 0..<rows {
            for y in 0..<columns {
                if y == 0 || y == 9 {
                    grid[(x * columns) + y] = "9"
                }
                if x == 21 {
                    grid[(x * columns) + y] = "9"
                }
            }
        }
        // add obstacles for testing
        //grid[(10 * columns) + 4] = "6"
    }
    func indexIsValid(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    func returnDisplay(numColumns: Int) -> [[String]]{
        var sArray = [[String]]()
        var temp = [String]()
        
        for x in grid {
            temp.append(x)
            
            if temp.count == numColumns {
                sArray.append(temp)
                
                temp = []
            }
        }
        if !temp.isEmpty {
            sArray.append(temp)
        }
        
        return sArray
    }
   
    subscript(row: Int, column: Int) -> String {
        get {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValid(row: row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }

    
    
    
    
    
    
    
    
    
    
    
}

