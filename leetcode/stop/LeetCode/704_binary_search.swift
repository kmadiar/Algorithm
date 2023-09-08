//
//  704_binary_search.swift
//  stop
//
//  Created by Kostiantyn Madiar on 19.07.2023.
//

import Foundation

/*

 704. Binary Search
 Easy
 Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.

 You must write an algorithm with O(log n) runtime complexity.



 Example 1:

 Input: nums = [-1,0,3,5,9,12], target = 9
 Output: 4
 Explanation: 9 exists in nums and its index is 4
 Example 2:

 Input: nums = [-1,0,3,5,9,12], target = 2
 Output: -1
 Explanation: 2 does not exist in nums so return -1


 Constraints:

 1 <= nums.length <= 104
 -104 < nums[i], target < 104
 All the integers in nums are unique.
 nums is sorted in ascending order.

 */

enum __704 {
    class Solution {
        func search(_ nums: [Int], _ target: Int) -> Int {
            var leftIndex = 0
            var rightIndex = nums.count

            repeat {
                let pivotIndex = (rightIndex + leftIndex) / 2
                let number = nums[pivotIndex]
                if number == target {
                    return pivotIndex
                }

                if number < target {
                    leftIndex = pivotIndex + 1
                } else {
                    rightIndex = pivotIndex
                }
            } while rightIndex != leftIndex

            return -1
        }
    }
}

/*
 let inputs = [
     (([-1,0,3,5,9,12], 9), 4),
     (([-1,0,3,5,9,12], 2), -1),
     (([5], 5), 0),
     (([2, 5], 2), 0)
  ]

  inputs.forEach { (input, result) in
      let solution = __704.Solution()
      let output = solution.search(input.0, input.1)

      print(output == result)
  }
 */
