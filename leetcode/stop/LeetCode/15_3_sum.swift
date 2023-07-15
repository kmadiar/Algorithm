//
//  15_3_sum.swift
//  stop
//
//  Created by Kostiantyn Madiar on 15.07.2023.
//

import Foundation

enum __15 {
    class Solution {
        struct Pair: Hashable {
            let x: Int
            let y: Int
        }

        func threeSum(_ nums: [Int]) -> [[Int]] {
            guard nums.count > 2 else {
                return []
            }

            var result: [[Int]] = []
            var set: Set<Pair> = Set<Pair>()
            let sortedNums = nums.sorted()
            for first in 0..<sortedNums.count - 2 {
                var second = first + 1
                var third = sortedNums.count - 1
                while second < third {
                    let out = sortedNums[first] + sortedNums[second] + sortedNums[third]
                    if out > 0 {
                        third -= 1
                    } else if out < 0 {
                        second += 1
                    } else {
                        let zapa = Pair(x: sortedNums[first], y: sortedNums[second])
                        if !set.contains(zapa) {
                            let out = [sortedNums[first], sortedNums[second], sortedNums[third]]
                            result.append(out)
                            set.insert(zapa)
                        }
                        second += 1
                        third -= 1
                    }
                }
            }
            return result
        }
    }
}
