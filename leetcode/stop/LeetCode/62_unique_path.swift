//
//  62_unique_path.swift
//  stop
//
//  Created by Kostiantyn Madiar on 06/09/2023.
//

import Foundation
/*
 62. Unique Paths
 Medium
 Companies
 There is a robot on an m x n grid. The robot is initially located at the top-left corner (i.e., grid[0][0]). The robot tries to move to the bottom-right corner (i.e., grid[m - 1][n - 1]). The robot can only move either down or right at any point in time.

 Given the two integers m and n, return the number of possible unique paths that the robot can take to reach the bottom-right corner.

 The test cases are generated so that the answer will be less than or equal to 2 * 109.



 Example 1:


 Input: m = 3, n = 7
 Output: 28
 Example 2:

 Input: m = 3, n = 2
 Output: 3
 Explanation: From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
 1. Right -> Down -> Down
 2. Down -> Down -> Right
 3. Down -> Right -> Down


 Constraints:

 1 <= m, n <= 100
 */

enum __62 {
    class Solution {
        func uniquePaths(_ m: Int, _ n: Int) -> Int {
            let rows = Array(repeating: 0, count: n)
            var grid = Array(repeating: rows, count: m)
            grid[0][0] = 1
            for row in 0..<m {
                for column in 0..<n {
                    let left = (column - 1) < 0 ? 0 : grid[row][column - 1]
                    let top = (row - 1) < 0 ? 0 : grid[row - 1][column]
                    grid[row][column] = max((left + top), grid[row][column])
                    print(left, top)
                }
            }
            return grid[m - 1][n - 1]
        }
    }
}

/*
 let input = [(3, 7),
              (3, 2)]

 let expectation = [28, 3]

 let solution = __62.Solution()
 zip(input, expectation)
     .forEach { input, expected in
         let result = solution.uniquePaths(input.0, input.1)
         print(result == expected)
         print(result)
     }
 */
