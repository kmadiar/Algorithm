//
//  2009_minimum_number_of_operations.swift
//  stop
//
//  Created by Kostiantyn Madiar on 10/10/2023.
//

import Foundation

enum __2009 {
    /*
     2009. Minimum Number of Operations to Make Array Continuous
     Hard
     You are given an integer array nums. In one operation, you can replace any element in nums with any integer.

     nums is considered continuous if both of the following conditions are fulfilled:

     All elements in nums are unique.
     The difference between the maximum element and the minimum element in nums equals nums.length - 1.
     For example, nums = [4, 2, 5, 3] is continuous, but nums = [1, 2, 3, 5, 6] is not continuous.

     Return the minimum number of operations to make nums continuous.



     Example 1:

     Input: nums = [4,2,5,3]
     Output: 0
     Explanation: nums is already continuous.
     Example 2:

     Input: nums = [1,2,3,5,6]
     Output: 1
     Explanation: One possible solution is to change the last element to 4.
     The resulting array is [1,2,3,5,4], which is continuous.
     Example 3:

     Input: nums = [1,10,100,1000]
     Output: 3
     Explanation: One possible solution is to:
     - Change the second element to 2.
     - Change the third element to 3.
     - Change the fourth element to 4.
     The resulting array is [1,2,3,4], which is continuous.


     Constraints:

     1 <= nums.length <= 105
     1 <= nums[i] <= 109
     */
    class Solution {
        func minOperations(_ nums: [Int]) -> Int {
            let sortedNums = Array(Set(nums))
                .sorted()

            var output = Int.max

            let count = nums.count
            let difference = count - 1

            for (index, start) in sortedNums.enumerated() {
                let end = start + difference
                let insertionPoint = search(end, in: sortedNums)
                output = min(output, count - (insertionPoint - index))
            }

            return output
        }

        func search(_ number: Int, in array: [Int]) -> Int {
            var start = 0
            var end = array.count - 1

            while start < end {
                let pivot = (start + end) / 2

                let pivotElement = array[pivot]

                if pivotElement == number {
                    return pivot + 1
                }
                if pivotElement < number {
                    start = pivot + 1
                } else {
                    end = pivot - 1
                }
            }

            return end
        }
    }
}
