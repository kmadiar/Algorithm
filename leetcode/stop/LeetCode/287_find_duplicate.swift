//
//  287_find_duplicate.swift
//  stop
//
//  Created by Kostiantyn Madiar on 19/09/2023.
//

import Foundation

/*
 287. Find the Duplicate Number
 Solved
 Medium
 Topics
 Companies
 Given an array of integers nums containing n + 1 integers where each integer is in the range [1, n] inclusive.

 There is only one repeated number in nums, return this repeated number.

 You must solve the problem without modifying the array nums and uses only constant extra space.



 Example 1:

 Input: nums = [1,3,4,2,2]
 Output: 2
 Example 2:

 Input: nums = [3,1,3,4,2]
 Output: 3


 Constraints:

 1 <= n <= 105
 nums.length == n + 1
 1 <= nums[i] <= n
 All the integers in nums appear only once except for precisely one integer which appears two or more times.


 Follow up:

 How can we prove that at least one duplicate number must exist in nums?
 Can you solve the problem in linear runtime complexity?
 */

enum __287 {
    class Solution {
        func findDuplicate(_ nums: [Int]) -> Int {
            var slow = nums[0]
            var fast = nums[0]

            repeat {
                fast = nums[nums[fast]]
                slow = nums[slow]
            } while fast != slow

            slow = nums[0]

            while slow != fast {
                slow = nums[slow]
                fast = nums[fast]
            }

            return fast
        }
    }
}
