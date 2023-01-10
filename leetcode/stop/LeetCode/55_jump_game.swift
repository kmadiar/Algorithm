//
//  55_jump_game.swift
//  stop
//
//  Created by Kostiantyn Madiar on 26.12.2022.
//

import Foundation

enum __55 {
    class Solution {
        func canJump(_ nums: [Int]) -> Bool {
            var currentJump = nums[0]

            for index in 0..<nums.count {
                if index <= currentJump {
                    currentJump = max(index + nums[index], currentJump)
                } else {
                    break
                }
            }

            return currentJump >= nums.count - 1
        }
    }
}

/*
 let inputs = [
     ([2,3,1,1,4], true),
     ([3,2,1,0,4], false),
     ([2,0], true),
     ([2, 0, 0], true),
     ([1,2,0,1], true),
     ([1,1,2,2,0,1,1], true)
 ]

 inputs.forEach { (input, result) in
     let solution = __55.Solution()
     let output = solution.canJump(input)

 //    print(output)
     print(output == result)
 }
 */
