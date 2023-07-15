//
//  42_trapping_raining_water.swift
//  stop
//
//  Created by Kostiantyn Madiar on 15.07.2023.
//

import Foundation

enum __42 {
    class Solution {
        func trap(_ height: [Int]) -> Int {
            var leftIndex = 0
            var rightIndex = height.count - 1
            var output = 0

            var maxLeft = height[leftIndex]
            var maxRight = height[rightIndex]

            while rightIndex > leftIndex {
                if maxLeft < maxRight {
                    leftIndex += 1
                    maxLeft = max(maxLeft, height[leftIndex])
                    output += maxLeft - height[leftIndex]
                } else {
                    rightIndex -= 1
                    maxRight = max(maxRight, height[rightIndex])
                    output += maxRight - height[rightIndex]
                }
            }

            return output
        }
    }
}

/*
 let inputs = [
     ([0,1,0,2,1,0,1,3,2,1,2,1], 6),
     ([4,2,0,3,2,5], 9)
  ]

  inputs.forEach { (input, result) in
      let solution = __42.Solution()
      let output = solution.trap(input)

      print(output == result)
  }

 */
