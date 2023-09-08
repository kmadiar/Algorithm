//
//  118_pascal_triangle.swift
//  stop
//
//  Created by Kostiantyn Madiar on 08/09/2023.
//

import Foundation

/*
 118. Pascal's Triangle
 Easy

 Given an integer numRows, return the first numRows of Pascal's triangle.

 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:

 Example 1:

 Input: numRows = 5
 Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
 Example 2:

 Input: numRows = 1
 Output: [[1]]


 Constraints:

 1 <= numRows <= 30
 */

enum __118 {
    class Solution {
        func generate(_ numRows: Int) -> [[Int]] {
            var grid: [[Int]] = []

            grid.append([1])

            for row in 1..<numRows {
                grid.append([])
                for column in 0...row {
                    let topLeft = column - 1 >= 0 ? grid[row - 1][column - 1] : 0
                    let topTop = column == row ? 0 : grid[row - 1][column]
                    let value = topLeft + topTop
                    grid[row].append(value)
                }
            }

            return grid
        }
    }
}
