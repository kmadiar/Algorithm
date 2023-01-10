//
//  2244_minimum_rounds.swift
//  stop
//
//  Created by Kostiantyn Madiar on 04.01.2023.
//

import Foundation
/*
 2244. Minimum Rounds to Complete All Tasks
 Medium
 You are given a 0-indexed integer array tasks, where tasks[i] represents the difficulty level of a task. In each round, you can complete either 2 or 3 tasks of the same difficulty level.

 Return the minimum rounds required to complete all the tasks, or -1 if it is not possible to complete all the tasks.
 */


enum __2244 {
    class Solution {
        func minimumRounds(_ tasks: [Int]) -> Int {
            let map = process(tasks)
            var invalidResult = false
            var result = 0
            map.forEach { key, value in
                let taskCount = map[key]!
                if let checkOutput = check(taskCount) {
                    result += checkOutput
                } else {
                    invalidResult = true
                }
            }

            if invalidResult {
                return -1
            }
            return result
        }

        func process(_ tasks: [Int]) -> [Int: Int] {
            var output: [Int: Int] = [:]
            tasks.forEach { task in
                output[task] = (output[task] ?? 0) + 1
            }

            return output
        }

        func check(_ taskCount: Int) -> Int? {
            if taskCount == 1 {
                return nil
            }
            return check3(taskCount)
        }

        func check3(_ taskCount: Int) -> Int? {
            if taskCount % 3 == 0 {
                return taskCount / 3
            }
            return taskCount / 3 + 1
        }
    }
}

//[
//    ([2,2,3,3,2,4,4,4,4,4], 4),
//    ([2,3,3], -1),
//    ([5,5,5,5], 2),
//    ([5,5,5,5,5,5,5], 3),
//    ([66,66,63,61,63,63,64,66,66,65,66,65,61,67,68,66,62,67,61,64,66,60,69,66,65,68,63,60,67,62,68,60,66,64,60,60,60,62,66,64,63,65,60,69,63,68,68,69,68,61], 20)
//]
//.forEach { input, expected in
//    let output = __2244.Solution().minimumRounds(input)
//    print(output == expected)
//}
