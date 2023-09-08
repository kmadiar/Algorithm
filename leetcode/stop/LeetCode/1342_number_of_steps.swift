//
//  1342_number_of_steps.swift
//  stop
//
//  Created by Kostiantyn Madiar on 04.04.2023.
//

import Foundation

enum __1342 {
    class Solution {
        func numberOfSteps(_ num: Int) -> Int {
            var num = num
            var steps = 0
            while num > 0 {
            if num & 1 == 0 {
                num = num >> 1
            } else {
                num -= 1
            }
                steps += 1
            }
            return steps
        }
    }
}
