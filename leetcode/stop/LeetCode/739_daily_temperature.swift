//
//  739_daily_temperature.swift
//  stop
//
//  Created by Kostiantyn Madiar on 18.12.2022.
//

import Foundation

enum __739 {
    class Solution {
        func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
            guard !temperatures.isEmpty else { return [] }
            guard temperatures.count > 1 else { return [0] }

            var output: [Int] = []
            let reversed = Array(temperatures.reversed())

            for index in 1..<temperatures.count {
                if reversed[index] < reversed[index - 1] {
                    output.append(1)
                }
            }
            return [] // TODO: - unfinished
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
