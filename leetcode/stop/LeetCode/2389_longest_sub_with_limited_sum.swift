//
//  2389_longest_sub_with_limited_sum.swift
//  stop
//
//  Created by Kostiantyn Madiar on 25.12.2022.
//

import Foundation

enum __2389 {
    class Solution {
        func answerQueries(_ nums: [Int], _ queries: [Int]) -> [Int] {
            guard nums.count > 0 else { return [] }
            var sorted = nums.sorted()

            for index in 1..<nums.count {
                sorted[index] += sorted[index - 1]
            }

            return queries.map { number in
                visit(sorted, target: number)
            }
        }

        func visit(_ array: [Int], target: Int) -> Int {
            var left = 0
            var right = array.count - 1
            while left < right {
                let middle = (left + right) / 2
                let result = array[middle]
                if result == target {
                    return middle + 1
                }

                if result < target {
                    left = middle + 1
                } else {
                    right = middle - 1
                }
            }
            return array[left] > target ? left : left + 1
        }
    }
}

//let inputs = [
//    ([4,5,2,1], [3,10,21], [2,3,4]),
//    ([2,3,4,5], [1], [0])
//]
//
//inputs.forEach { input in
//    let solution = __2389.Solution()
//
//    let result = solution.answerQueries(input.0, input.1)
//    print(result)
//    print(result == input.2)
//}
