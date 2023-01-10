//
//  448_find_all_numers_disappeared_in_array.swift
//  stop
//
//  Created by Kostiantyn Madiar on 10.12.2022.
//

import Foundation

enum __448 {
    class Solution {
        func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
            let numsSet = Set(nums)
            var output: [Int] = []

            for index in 1...nums.count {
                if !numsSet.contains(index) {
                    output.append(index)
                }
            }
            return output
        }
    }
}

//let solution = __448.Solution()
//
//print(solution.findDisappearedNumbers([1, 1]))
