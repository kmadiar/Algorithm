//
//  74_search_in_2d_matrix.swift
//  stop
//
//  Created by Kostiantyn Madiar on 19.07.2023.
//

import Foundation

/*
 74. Search a 2D Matrix
 Medium
 You are given an m x n integer matrix matrix with the following two properties:

 Each row is sorted in non-decreasing order.
 The first integer of each row is greater than the last integer of the previous row.
 Given an integer target, return true if target is in matrix or false otherwise.

 You must write a solution in O(log(m * n)) time complexity.



 Example 1:


 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 3
 Output: true
 Example 2:


 Input: matrix = [[1,3,5,7],[10,11,16,20],[23,30,34,60]], target = 13
 Output: false


 Constraints:

 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 100
 -104 <= matrix[i][j], target <= 104
 */

enum __74 {
    class Solution {
        func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
            var leftIndex = 0
            let rowLength = matrix[0].count
            let size = matrix.count * rowLength
            var rightIndex = size - 1

            repeat {
                let pivotIndex = (rightIndex + leftIndex) / 2

                let row = pivotIndex / rowLength
                let column = pivotIndex - row * rowLength
                let number = matrix[row][column]
                if number == target {
                    return true
                }

                if number < target {
                    leftIndex = pivotIndex + 1
                } else {
                    rightIndex = pivotIndex - 1
                }

            } while leftIndex <= rightIndex

            return false
        }
    }
}

/*

 let inputs = [
     (([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 3), true),
     (([[1,3,5,7],[10,11,16,20],[23,30,34,60]], 13), false),
     (([[1]], 2), false),
     (([[1, 3]], 3), true),
  ]

  inputs.forEach { (input, result) in
      let solution = __74.Solution()
      let output = solution.searchMatrix(input.0, input.1)

      print(output == result)
  }
 */
