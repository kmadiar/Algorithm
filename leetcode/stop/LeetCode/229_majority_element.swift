//
//  229_majority_element.swift
//  stop
//
//  Created by Kostiantyn Madiar on 05/10/2023.
//

import Foundation

enum __229 {
    /*
     229. Majority Element II
     Medium
     Given an integer array of size n, find all elements that appear more than ⌊ n/3 ⌋ times.



     Example 1:

     Input: nums = [3,2,3]
     Output: [3]
     Example 2:

     Input: nums = [1]
     Output: [1]
     Example 3:

     Input: nums = [1,2]
     Output: [1,2]


     Constraints:

     1 <= nums.length <= 5 * 104
     -109 <= nums[i] <= 109


     Follow up: Could you solve the problem in linear time and in O(1) space?
     */
    class Solution {
        func majorityElement(_ nums: [Int]) -> [Int] {
            var countMap: [Int: Int] = [:]
            for number in nums {
                countMap[number] = (countMap[number] ?? 0) + 1
            }

            let threshold = nums.count / 3
            return countMap
            .filter { $0.1 > threshold }
            .map { $0.0 }
        }
    }
}
