//
//  739_daily_temperature.swift
//  stop
//
//  Created by Kostiantyn Madiar on 18.12.2022.
//

import Foundation

/*
 739. Daily Temperatures
 Medium
 Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature. If there is no future day for which this is possible, keep answer[i] == 0 instead.



 Example 1:

 Input: temperatures = [73,74,75,71,69,72,76,73]
 Output: [1,1,4,2,1,1,0,0]
 Example 2:

 Input: temperatures = [30,40,50,60]
 Output: [1,1,1,0]
 Example 3:

 Input: temperatures = [30,60,90]
 Output: [1,1,0]


 Constraints:

 1 <= temperatures.length <= 105
 30 <= temperatures[i] <= 100
 */

enum __739 {
    class Solution {
        func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
            var output = Array(repeating: 0, count: temperatures.count)
            var stack: [Int] = []

            for index in 0..<temperatures.count {
                while let lastIndex = stack.last,
                      temperatures[lastIndex] < temperatures[index] {
                    _ = stack.removeLast()
                    output[lastIndex] = index - lastIndex
                }
                stack.append(index)
            }

            return output
        }
    }
}
//let inputs = [
//    ([73,74,75,71,69,72,76,73], [1,1,4,2,1,1,0,0]),
//    ([30,40,50,60], [1,1,1,0]),
//    ([30,60,90], [1,1,0])
//]
//
//inputs.forEach { input in
//    let solution = __739.Solution()
//    let output = solution.dailyTemperatures(input.0)
//    print(output)
//    print(output == input.1)
//}
