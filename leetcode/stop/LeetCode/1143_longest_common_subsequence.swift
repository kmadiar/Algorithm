//
//  1143_longest_common_subsequence.swift
//  stop
//
//  Created by Kostiantyn Madiar on 15.12.2022.
//

import Foundation

enum __1143 {
    class Solution {
        func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
            let text1 = Array(text1)
            let text2 = Array(text2)
            var solution: [[Int]] = .init(repeating: .init(repeating: 0,
                                                           count: text1.count + 1),
                                          count: text2.count + 1)
            for i in 0..<text2.count {
                for j in 0..<text1.count {
                    solution[i + 1][j + 1] = text2[i] == text1[j] ? solution[i][j] + 1 : max(solution[i + 1][j],
                                                                                                                     solution[i][j + 1])
                }
            }
            return solution[text2.count][text1.count]
        }
    }
}

//let solution = __1143.Solution()
//
//[
//    ("abcde", "ace", 3),
//    ("abc", "abc", 3),
//    ("abc", "def", 0),
//    ("ezupkr", "ubmrapg", 2)
//]
//    .map { input in
//        solution.longestCommonSubsequence(input.0, input.1) == input.2
//    }.forEach {
//        print($0)
//    }
