//
//  2707_extra_character_in_string.swift
//  stop
//
//  Created by Kostiantyn Madiar on 06/09/2023.
//

import Foundation

/*
 2707. Extra Characters in a String
 Medium
 1.8K
 76
 Companies
 You are given a 0-indexed string s and a dictionary of words dictionary. You have to break s into one or more non-overlapping substrings such that each substring is present in dictionary. There may be some extra characters in s which are not present in any of the substrings.

 Return the minimum number of extra characters left over if you break up s optimally.



 Example 1:

 Input: s = "leetscode", dictionary = ["leet","code","leetcode"]
 Output: 1
 Explanation: We can break s in two substrings: "leet" from index 0 to 3 and "code" from index 5 to 8. There is only 1 unused character (at index 4), so we return 1.

 Example 2:

 Input: s = "sayhelloworld", dictionary = ["hello","world"]
 Output: 3
 Explanation: We can break s in two substrings: "hello" from index 3 to 7 and "world" from index 8 to 12. The characters at indices 0, 1, 2 are not used in any substring and thus are considered as extra characters. Hence, we return 3.


 Constraints:

 1 <= s.length <= 50
 1 <= dictionary.length <= 50
 1 <= dictionary[i].length <= 50
 dictionary[i] and s consists of only lowercase English letters
 dictionary contains distinct words
 */

enum __2707 {
    class Solution {
        let tree = TrieTree()
        func minExtraChar(_ s: String, _ dictionary: [String]) -> Int {
            dictionary.forEach(tree.insert(word:))

            var startIndex = 0
            let characters = Array(s)
            var endIndex = 0
            while endIndex < s.count {
                let prefix = String(characters[startIndex...endIndex])
                if tree.contains(prefix: prefix) {
//                    memo[startIndex] =
                } else {
                    startIndex = endIndex
                }
                endIndex += 1
            }

            return 0
        }
    }

    class TrieTree {
        class Node {
            init(key: Character? = nil) {
                self.key = key
            }
            let key: Character?
            var value: String? = nil
            var children: [Character: Node] = [:]
        }

        let root = Node()

        func insert(word: String) {
            var currentNode = root
            let characters = Array(word)

            var currentIndex = 0

            while currentIndex < characters.count {
                let currentKey = characters[currentIndex]
                if let childNode = currentNode.children[currentKey] {
                    currentNode = childNode
                } else {
                    let newNode = Node(key: currentKey)
                    currentNode.children[currentKey] = newNode
                    currentNode = newNode
                }
                currentIndex += 1
            }
            currentNode.value = word
        }

        func contains(prefix: String) -> Bool {
            var currentNode = root
            let characters = Array(prefix)

            var currentIndex = 0

            while currentIndex < characters.count {
                let currentKey = characters[currentIndex]

                if let childNode = currentNode.children[currentKey] {
                    currentNode = childNode
                } else {
                    return false
                }

                currentIndex += 1
            }

            return true
        }
    }
}

/*
 let inputs = [
     ("sayhello", ["say", "hello"]),
 //    ("sayzhello", ["say", "hello"]),
 //    ("zsay", ["say"]),
 ]

 let expectation = [
     0,
     1,
     1
 ]
 let solution = __2707.Solution()

 zip(inputs, expectation)
     .forEach { input, expectation in
         let result = solution.minExtraChar(input.0, input.1)
         print(result == expectation)
         print(result, expectation)
     }

 */
