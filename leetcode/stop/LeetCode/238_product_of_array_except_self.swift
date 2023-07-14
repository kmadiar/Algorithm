//
//  238.swift
//  stop
//
//  Created by Kostiantyn Madiar on 14.07.2023.
//

import Foundation

enum __238 {
    /*
     238. Product of Array Except Self
     Medium
     Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

     The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

     You must write an algorithm that runs in O(n) time and without using the division operation.

     Example 1:

     Input: nums = [1,2,3,4]
     Output: [24,12,8,6]
     Example 2:

     Input: nums = [-1,1,0,-3,3]
     Output: [0,0,9,0,0]


     Constraints:

     2 <= nums.length <= 105
     -30 <= nums[i] <= 30
     The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.


     Follow up: Can you solve the problem in O(1) extra space complexity? (The output array does not count as extra space for space complexity analysis.)
     */

    class Solution {
        func productExceptSelf(_ nums: [Int]) -> [Int] {

            let left = makeProductArray(input: nums)
            let right = Array(makeProductArray(input: nums.reversed()).reversed())

            var output: [Int] = [right[1]]
            for index in 1..<nums.count - 1 {
                output.append(left[index - 1] * right[index + 1])
            }
            output.append(left[nums.count - 2])
            return output
        }

        func makeProductArray(input: [Int]) -> [Int] {
            var output: [Int] = [input[0]]
            for index in 1..<input.count {
                let value = output[index - 1] * input[index]
                output.append(value)
            }
            return output
        }
    }
}

/*

 let inputs = [
     ([1, 2, 3, 4, 5], [120, 60, 40, 30, 24]),
     ([1, 2], [2, 1])
 ]

 inputs.forEach { input, result in
     let solution = __238.Solution()
     let output = solution.productExceptSelf(input)

     print(output == result)
 }
 */
