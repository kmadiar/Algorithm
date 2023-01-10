//
//  931_minimum_failing_path_sum.swift
//  stop
//
//  Created by Kostiantyn Madiar on 13.12.2022.
//

import Foundation

enum __931 {
    class Solution {
        func minFallingPathSum(_ matrix: [[Int]]) -> Int {
            guard !matrix.isEmpty else { return 0 }
            var matrix = matrix
            var minValue = Int.max
            for i in 1..<matrix.count {
                for j in 0..<matrix[i].count {
                    let left = (j - 1) < 0 ? Int.max : matrix[i-1][j-1]
                    let mid = matrix[i-1][j]
                    let right = (j + 1) > (matrix[i-1].count - 1) ? Int.max : matrix[i-1][j+1]
                    matrix[i][j] = min(left, mid, right) + matrix[i][j]
                    minValue = min(minValue, matrix[i][j])
                }
            }
            return matrix.last!.min()!
        }
    }
}


//let solution = __931.Solution()
//
//let input = [
//    [[2,1,3],[6,5,4],[7,8,9]]
//]
//
//input.forEach { value in
//    print(solution.minFallingPathSum(value))
//}
