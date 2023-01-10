//
//  290_word_pattern.swift
//  stop
//
//  Created by Kostiantyn Madiar on 01.01.2023.
//

import Foundation

enum __290 {
    class Solution {
        func wordPattern(_ pattern: String, _ s: String) -> Bool {
            var map: [String: String] = [:]
            let words = s.split(separator: " ").map(String.init)
            let patterns = pattern.map(String.init)

            var output = true

            guard Set(words).count == Set(patterns).count else {
                return false
            }

            patterns.enumerated().forEach { index, pattern in
                let expected = words[index]
                let mapValue = map[pattern]
                if let mapValue = mapValue {
                    output = output && (mapValue == expected)
                } else {
                    map[pattern] = expected
                }
            }

            if !output {
                return false
            }

            var result = ""

            patterns.enumerated().forEach { index, pattern in
                let word = map[pattern] ?? ""
                if result.isEmpty {
                    result = word
                } else {
                    result += " " + word
                }
            }

            return result == s
        }
    }
}

//let inputs = [
//    ("abba", "dog cat cat dog", true),
//    ("abba", "dog cat cat fish", false),
//    ("aaaa", "dog cat cat dog", false),
//    ("abba", "dog dog dog dog", false)
//]
//
//inputs.forEach { pattern, string, expected in
//    let solution = __290.Solution()
//
//    let result = solution.wordPattern(pattern, string)
//
////    print(result)
//    print(expected == result)
//}
