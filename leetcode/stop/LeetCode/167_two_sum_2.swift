//
//  167.swift
//  stop
//
//  Created by Kostiantyn Madiar on 15.07.2023.
//

import Foundation

/*
 167. Two Sum II - Input Array Is Sorted
 Medium
 Given a 1-indexed array of integers numbers that is already sorted in non-decreasing order, find two numbers such that they add up to a specific target number. Let these two numbers be numbers[index1] and numbers[index2] where 1 <= index1 < index2 < numbers.length.

 Return the indices of the two numbers, index1 and index2, added by one as an integer array [index1, index2] of length 2.

 The tests are generated such that there is exactly one solution. You may not use the same element twice.

 Your solution must use only constant extra space.



 Example 1:

 Input: numbers = [2,7,11,15], target = 9
 Output: [1,2]
 Explanation: The sum of 2 and 7 is 9. Therefore, index1 = 1, index2 = 2. We return [1, 2].
 Example 2:

 Input: numbers = [2,3,4], target = 6
 Output: [1,3]
 Explanation: The sum of 2 and 4 is 6. Therefore index1 = 1, index2 = 3. We return [1, 3].
 Example 3:

 Input: numbers = [-1,0], target = -1
 Output: [1,2]
 Explanation: The sum of -1 and 0 is -1. Therefore index1 = 1, index2 = 2. We return [1, 2].


 Constraints:

 2 <= numbers.length <= 3 * 104
 -1000 <= numbers[i] <= 1000
 numbers is sorted in non-decreasing order.
 -1000 <= target <= 1000
 The tests are generated such that there is exactly one solution.
 */

enum __167 {
    class Solution {
        func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
            var headIndex = 0
            var tailIndex = numbers.count - 1

            while tailIndex - headIndex > 0 {
                let firstNumber = numbers[headIndex]
                if let foundedIndex = find(in: Array(numbers[headIndex + 1...tailIndex]),
                                          number: target - firstNumber) {
                    let secondIndex = foundedIndex + headIndex + 1
                    return [headIndex + 1, secondIndex + 1]
                }
                headIndex += 1
            }

            return []
        }

        /// Search for item index
        /// - Returns: index of the matched element
        func find(in array: [Int],
                  number: Int)
        -> Int? {
            var left = 0
            var right = array.count - 1

            while left <= right {
                let pivot = (right - left) / 2 + left
                let founded = array[pivot]
                if founded == number {
                    return pivot
                }
                if founded > number {
                    right = pivot - 1
                    continue
                }
                left = pivot + 1
            }

            return nil
        }
    }
}

/*

    let inputs = [
        (([2,7,11,15], 9), [1,2]),
        (([2,3,4], 6), [1,3]),
        (([5, 25, 75], 100), [2, 3]),
        (([1,2,3,4,4,9,56,90], 8), [4, 5])
     ]

     inputs.forEach { (input, result) in
         let solution = __167.Solution()
         let output = solution.twoSum(input.0, input.1)

         print(output == result)
     }
*/
