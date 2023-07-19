//
//  84_largest_rectangle.swift
//  stop
//
//  Created by Kostiantyn Madiar on 19.07.2023.
//

import Foundation

/*
 84. Largest Rectangle in Histogram
 Hard
 Given an array of integers heights representing the histogram's bar height where the width of each bar is 1, return the area of the largest rectangle in the histogram.



 Example 1:


 Input: heights = [2,1,5,6,2,3]
 Output: 10
 Explanation: The above is a histogram where width of each bar is 1.
 The largest rectangle is shown in the red area, which has an area = 10 units.
 Example 2:


 Input: heights = [2,4]
 Output: 4


 Constraints:

 1 <= heights.length <= 105
 0 <= heights[i] <= 104
 */

enum __84 {
    class Solution {
        func largestRectangleArea(_ heights: [Int]) -> Int {
            var maxHeight = 0

            var stack: [(Int, Int)] = []

            for (index, height) in heights.enumerated() {
                var start = index
                while let last = stack.last, last.1 > height {
                    _ = stack.removeLast()
                    start = last.0
                    maxHeight = max(maxHeight, last.1 * (index - start))
                }

                stack.append((start, height))
            }

            for (index, height) in stack {
                maxHeight = max(maxHeight, height * (heights.count - index))
            }

            return maxHeight
        }
    }
}

/*

 let inputs = [
     ([2,4], 4),
     ([2,1,5,6,2,3], 10)
  ]

  inputs.forEach { (input, result) in
      let solution = __84.Solution()
      let output = solution.largestRectangleArea(input)

      print(output == result)
  }
 */
