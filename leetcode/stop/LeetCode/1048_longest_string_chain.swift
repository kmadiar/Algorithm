//
//  1048_longest_string_chain.swift
//  stop
//
//  Created by Kostiantyn Madiar on 23/09/2023.
//

import Foundation

/*
 1048. Longest String Chain
 Medium
 You are given an array of words where each word consists of lowercase English letters.

 wordA is a predecessor of wordB if and only if we can insert exactly one letter anywhere in wordA without changing the order of the other characters to make it equal to wordB.

 For example, "abc" is a predecessor of "abac", while "cba" is not a predecessor of "bcad".
 A word chain is a sequence of words [word1, word2, ..., wordk] with k >= 1, where word1 is a predecessor of word2, word2 is a predecessor of word3, and so on. A single word is trivially a word chain with k == 1.

 Return the length of the longest possible word chain with words chosen from the given list of words.



 Example 1:

 Input: words = ["a","b","ba","bca","bda","bdca"]
 Output: 4
 Explanation: One of the longest word chains is ["a","ba","bda","bdca"].
 Example 2:

 Input: words = ["xbc","pcxbcf","xb","cxbc","pcxbc"]
 Output: 5
 Explanation: All the words can be put in a word chain ["xb", "xbc", "cxbc", "pcxbc", "pcxbcf"].
 Example 3:

 Input: words = ["abcd","dbqca"]
 Output: 1
 Explanation: The trivial word chain ["abcd"] is one of the longest word chains.
 ["abcd","dbqca"] is not a valid word chain because the ordering of the letters is changed.


 Constraints:

 1 <= words.length <= 1000
 1 <= words[i].length <= 16
 words[i] only consists of lowercase English letters.
 */

enum __1048 {
    class Solution {
        func longestStrChain(_ words: [String]) -> Int {
            guard !words.isEmpty else { return 0 }

            var wordMap: [String: Int] = [:]
            var indexMap: [Int: Int] = [:]

            words.enumerated().forEach { index, word in
                wordMap[word] = index
            }

            func checkCombination(_ wordIndex: Int) -> Int {
                if let longestChain = indexMap[wordIndex] {
                    return longestChain
                }

                var output = 1
                let combinations = combinations(words[wordIndex])

                for combination in combinations {
                    if let prevIndex = wordMap[combination] {
                        output = max(output, 1 + checkCombination(prevIndex))
                    }
                }

                indexMap[wordIndex] = output

                return output
            }

            var output = 0

            for index in 0..<words.count {
                output = max(output, checkCombination(index))
            }

            return output
        }


        func combinations(_ input: String) -> [String] {
            var output: [String] = []
            let characters = Array(input)
            for index in 0..<input.count {
                output.append(String(characters[..<index] + characters[(index + 1)...]))
            }
            return output
        }
    }
}

/*
 let inputs = [
     ["a", "b", "ba", "bca", "bda", "bdca"],
 //    ["xbc", "pcxbcf", "xb", "cxbc", "pcxbc"],
 //    ["abcd", "dbqca"]
 ]

 let expected = [
     4,
     5,
     1
 ]

 let solution = __1048.Solution()
 zip(inputs, expected)
     .forEach { input, expected in
         let result = solution.longestStrChain(input)

         print(result == expected)
     }
 */
