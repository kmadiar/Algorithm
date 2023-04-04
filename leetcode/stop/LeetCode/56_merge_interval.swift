//
//  56_merge_interval.swift
//  stop
//
//  Created by Kostiantyn Madiar on 03.04.2023.
//

import Foundation

/*

 56. Merge Intervals
 Medium

 Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.
 */

enum __56 {
    class Solution {
        func merge(_ intervals: [[Int]]) -> [[Int]] {
            let sorted = intervals.sorted(by: { $0[0] < $1[0] })
            var output: [[Int]] = .init()
            for interval in sorted {
                if let last = output.last,
                   interval[0] <= last[1] {
                    output[output.count - 1] = merge(last, interval)
                } else {
                    output.append(Array(interval))
                }
            }

            return output
        }

        func merge(_ lhs: [Int], _ rhs: [Int]) -> [Int] {
            [min(lhs[0], rhs[0]), max(lhs[1], rhs[1])]
        }
    }
}

//let inputs = [
//     ([[1,3],[2,6],[8,10],[15,18]], [[1,6],[8,10],[15,18]]),
//     ([[1,4],[4,5]], [[1,5]]),
// ]
//
// inputs.forEach { (input, result) in
//     let solution = __56.Solution()
//     let output = solution.merge(input)
//
//     print(output == result)
// }
