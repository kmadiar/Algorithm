//
//  49_group_anagram.swift
//  stop
//
//  Created by Kostiantyn Madiar on 06.07.2023.
//

import Foundation

enum __49 {
    /*

     49. Group Anagrams
     Medium
     Given an array of strings strs, group the anagrams together. You can return the answer in any order.

     An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.



     Example 1:

     Input: strs = ["eat","tea","tan","ate","nat","bat"]
     Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
     Example 2:

     Input: strs = [""]
     Output: [[""]]
     Example 3:

     Input: strs = ["a"]
     Output: [["a"]]


     Constraints:

     1 <= strs.length <= 104
     0 <= strs[i].length <= 100
     strs[i] consists of lowercase English letters.

     */

    class Solution {
        func groupAnagrams(_ strs: [String]) -> [[String]] {
            let sorted = strs.map { $0.sorted() }
            var dict: [String: [Int]] = [:]
            for (index, str) in sorted.enumerated() {
                let string = String(str)
                if let indexes = dict[string] {
                    dict[string] = indexes + [index]
                } else {
                    dict[string] = [index]
                }
            }

            var output: [[String]] = []
            dict.values.forEach { key in
                var group: [String] = []
                key.forEach { groupKey in
                    group.append(strs[groupKey])
                }
                output.append(group)
            }

            return output
        }
    }
}
