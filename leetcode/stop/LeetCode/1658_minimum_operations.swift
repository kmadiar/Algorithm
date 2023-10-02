//
//  1658_minimum_operations.swift
//  stop
//
//  Created by Kostiantyn Madiar on 20/09/2023.
//

import Foundation

/*
 1658. Minimum Operations to Reduce X to Zero
 Medium
 You are given an integer array nums and an integer x. In one operation, you can either remove the leftmost or the rightmost element from the array nums and subtract its value from x. Note that this modifies the array for future operations.

 Return the minimum number of operations to reduce x to exactly 0 if it is possible, otherwise, return -1.



 Example 1:

 Input: nums = [1,1,4,2,3], x = 5
 Output: 2
 Explanation: The optimal solution is to remove the last two elements to reduce x to zero.
 Example 2:

 Input: nums = [5,6,7,8,9], x = 4
 Output: -1
 Example 3:

 Input: nums = [3,2,20,1,1,3], x = 10
 Output: 5
 Explanation: The optimal solution is to remove the last three elements and the first two elements (5 operations in total) to reduce x to zero.


 Constraints:

 1 <= nums.length <= 105
 1 <= nums[i] <= 104
 1 <= x <= 109
 */

enum __1658 {
    class Solution {
        func minOperations(_ nums: [Int], _ x: Int) -> Int {
            let target = nums.reduce(0, +) - x

            if target == 0 {
                return nums.count
            }

            var length = 0
            var currentSum = 0
            var leftIndex = 0

            for (rightIndex, value) in nums.enumerated() {
                currentSum += value

                while leftIndex <= rightIndex && currentSum > target {
                    currentSum -= nums[leftIndex]
                    leftIndex += 1
                }
                if currentSum == target {
                    length = max(length, rightIndex - leftIndex + 1)
                }
            }

            return length > 0 ? nums.count - length : -1
        }
    }
}
