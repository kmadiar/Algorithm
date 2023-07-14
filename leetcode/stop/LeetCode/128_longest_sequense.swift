//
//  128_longest_sequense.swift
//  stop
//
//  Created by Kostiantyn Madiar on 14.07.2023.
//

import Foundation

enum __128 {
    /*
     128. Longest Consecutive Sequence
     Medium
     Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

     You must write an algorithm that runs in O(n) time.

     Example 1:

     Input: nums = [100,4,200,1,3,2]
     Output: 4
     Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
     Example 2:

     Input: nums = [0,3,7,2,5,8,4,6,0,1]
     Output: 9


     Constraints:

     0 <= nums.length <= 105
     -109 <= nums[i] <= 109
     */

    class Solution {
        func longestConsecutive(_ nums: [Int]) -> Int {
            let numbersSet = Set(nums)
            var output = 0
            for number in nums {
                guard !numbersSet.contains(number - 1) else { continue } // check if number is start of the sequence
                var longest = 1
                while numbersSet.contains(number + longest) { // check if set has next element in the sequence
                    longest += 1
                }

                output = max(output, longest)
            }

            return output
        }
    }
}

/*
 let inputs = [
     (([1,2,7]), 2),
     (([1,2,100,3,200,4,7]), 4),
  ]

  inputs.forEach { (input, result) in
      let solution = __128.Solution()
      let output = solution.longestConsecutive(input)

      print(output == result)
  }
 */
