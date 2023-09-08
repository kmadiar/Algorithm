//
//  33_search_in_rotated_sorted_array.swift
//  stop
//
//  Created by Kostiantyn Madiar on 19.07.2023.
//

import Foundation

/*
 33. Search in Rotated Sorted Array
 Medium
 There is an integer array nums sorted in ascending order (with distinct values).

 Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].

 Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

 You must write an algorithm with O(log n) runtime complexity.



 Example 1:

 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 Example 2:

 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 Example 3:

 Input: nums = [1], target = 0
 Output: -1


 Constraints:

 1 <= nums.length <= 5000
 -104 <= nums[i] <= 104
 All values of nums are unique.
 nums is an ascending array that is possibly rotated.
 -104 <= target <= 104
 */

enum __33 {
    class Solution {
        func search(_ nums: [Int], _ target: Int) -> Int {
            var left = 0
            var right = nums.count - 1

            while left <= right {
                let pivot = (right + left) / 2
                let number = nums[pivot]

                if number == target {
                    return pivot
                }

                if nums[left] <= number {
                    if target > number || target < nums[left]{
                        left = pivot + 1
                    } else {
                        right = pivot - 1
                    }
                } else {
                    if target < nums[pivot] || target > nums[right] {
                        right = pivot - 1
                    } else {
                        left = pivot + 1
                    }
                }
            }

            return -1
        }
    }
}

/*
 let inputs = [
     (([4,5,6,7,0,1,2], 0), 4),
     (([4,5,6,7,0,1,2], 3), -1),
     (([1], 0), -1),
     (([3,5,1], 3), 0)
  ]

  inputs.forEach { (input, result) in
      let solution = __33.Solution()
      let output = solution.search(input.0, input.1)

      print(output == result)
  }

 */
