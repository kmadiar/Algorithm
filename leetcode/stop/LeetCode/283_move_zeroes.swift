//
//  283_move_zeroes.swift
//  stop
//
//  Created by Kostiantyn Madiar on 06.12.2022.
//

import Foundation
// MARK: - Apple
enum __289 {
    class Solution {
        func moveZeroes(_ nums: inout [Int]) {
            var head: Int = 0

            for index in 0..<nums.count {
                if nums[index] != 0 {
                    let temp = nums[head]
                    nums[head] = nums[index]
                    nums[index] = temp
                    head += 1
                }
            }
        }
    }
}

//let solution = __289.Solution()
//var numbers = [0,0,0,1,0,1,0,2]
//solution.moveZeroes(&numbers)
//print(numbers)
