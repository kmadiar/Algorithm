//
//  34_positions_in_sorted_array.swift
//  stop
//
//  Created by Kostiantyn Madiar on 09/10/2023.
//

import Foundation

enum __34 {
    /*
     34. Find First and Last Position of Element in Sorted Array
     Medium
     Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.

     If target is not found in the array, return [-1, -1].

     You must write an algorithm with O(log n) runtime complexity.

     Example 1:

     Input: nums = [5,7,7,8,8,10], target = 8
     Output: [3,4]
     Example 2:

     Input: nums = [5,7,7,8,8,10], target = 6
     Output: [-1,-1]
     Example 3:

     Input: nums = [], target = 0
     Output: [-1,-1]


     Constraints:

     0 <= nums.length <= 105
     -109 <= nums[i] <= 109
     nums is a non-decreasing array.
     -109 <= target <= 109
     */

    class Solution {
        static let notFound = -1
        func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
            let leftPosition = findPosition(of: target, in: nums, toLeft: true)

            if leftPosition == Solution.notFound {
                return [Solution.notFound, Solution.notFound]
            }

            let rightPosition = findPosition(of: target, in: nums, toLeft: false)

            return [leftPosition, rightPosition]
        }

        func findPosition(of number: Int, in array: [Int], toLeft: Bool) -> Int {

            var leftBound = 0
            var rightBound = array.count - 1

            var output = Solution.notFound

            while leftBound <= rightBound {
                let pivot = rightBound + leftBound / 2
                let pivotValue = array[pivot]
                if pivotValue == number {
                    output = pivot
                    if toLeft {
                        rightBound = pivot - 1
                    } else {
                        leftBound = pivot + 1
                    }
                } else if pivotValue > number {
                    rightBound = pivot - 1
                } else {
                    leftBound = pivot + 1
                }
            }

            return output
        }
    }
}

/*
 let inputs = [
     ([5,7,7,8,8,10], 8),
     ([5,7,7,8,8,10], 6),
     ([], 8)
 ]

 let expectations = [
     [3,4],
     [-1,-1],
     [-1,-1]
 ]

 zip(inputs, expectations)
     .forEach { input, expected in
         let result = __34.Solution().searchRange(input.0, input.1)
         print(result == expected)
     }
 */
