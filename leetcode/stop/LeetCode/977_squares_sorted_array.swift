//
//  977_squares_sorted_array.swift
//  stop
//
//  Created by Kostiantyn Madiar on 10.12.2022.
//

import Foundation

enum __977 {
    class Solution {
        func pow(_ input: Int) -> Int {
            input * input
        }

        func sortedSquares(_ input: [Int]) -> [Int] {

            guard !input.isEmpty else {
                return []
            }
            var head = 0
            var tail = input.count - 1

            var result: [Int] = []

            while head != tail {
                let left = pow(input[head])
                let right = pow(input[tail])

                if left >= right {
                    result.append(left)
                    head += 1
                } else if right > left {
                    result.append(right)
                    tail -= 1
                }
            }

            if result.count < input.count {
                result.append(pow(input[head]))
            }

            return result.reversed()
        }
    }
}
