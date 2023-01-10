//
//  2279_max_bags_full_rocks.swift
//  stop
//
//  Created by Kostiantyn Madiar on 27.12.2022.
//

import Foundation

enum __2279 {
    class Solution {
        func maximumBags(_ capacity: [Int], _ rocks: [Int], _ additionalRocks: Int) -> Int {
            var diff: [Int] = []
            var result = 0

            for index in 0 ..< capacity.count {
                let addition = capacity[index] - rocks[index]
                if addition > 0 {
                    diff.append(addition)
                } else {
                    result += 1
                }
            }
            diff.sort()
            var additions = additionalRocks

            for index in 0..<diff.count {
                let item = diff[index]
                additions -= item
                if additions >= 0 {
                    result += 1
                } else {
                    break
                }
            }

            return result
        }
    }
}

//let inputs = [
//    ([2,3,4,5], [1,2,4,4], 2, 3),
//    ([10,2,2], [2,2,0], 100, 3)
//]
//
//inputs.forEach { (capacity, rocks, addition, expected) in
//    let solution = __2279.Solution()
//    let output = solution.maximumBags(capacity, rocks, addition)
//    print(output)
//    print(output == expected)
//}

