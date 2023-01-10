//
//  198_house_robber.swift
//  stop
//
//  Created by Kostiantyn Madiar on 14.12.2022.
//

import Foundation

enum __198 {
    class Solution {
        func rob(_ nums: [Int]) -> Int {
            var rob1 = 0
            var rob2 = 0

            for index in nums {
                let temp = max(index + rob1, rob2)
                rob1 = rob2
                rob2 = temp
            }

            return rob2
        }
    }
}

//let solution = __198.Solution()
//
//let input = [
//    [1, 2, 3, 1],
//    [1, 2, 3, 4, 5, 6]
//].forEach { value in
//    print(solution.rob(value))
//}
