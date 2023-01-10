//
//  1480.swift
//  stop
//
//  Created by Kostiantyn Madiar on 12.12.2022.
//

import Foundation

enum __1480 {
    class Solution {
        func runningSum(_ nums: [Int]) -> [Int] {
            guard nums.count > 1 else { return nums }
            var output = nums
            for index in 1..<nums.count {
                output[index] = nums[index] + output[index - 1]
            }
            return output
        }
    }
}
