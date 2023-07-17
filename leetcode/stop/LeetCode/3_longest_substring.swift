//
//  3_longest_substring.swift
//  stop
//
//  Created by Kostiantyn Madiar on 17.07.2023.
//

import Foundation

/*
 3. Longest Substring Without Repeating Characters
 Medium
 Given a string s, find the length of the longest
 substring
  without repeating characters.

 Example 1:

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:

 Input: s = "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:

 Input: s = "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.


 Constraints:

 0 <= s.length <= 5 * 104
 s consists of English letters, digits, symbols and spaces.
 */

enum __3 {
    class Solution {
        func lengthOfLongestSubstring(_ s: String) -> Int {
            let characters = Array(s)
            guard s.count > 1 else { return s.count }
            var leftIndex = 0
            var longestSequence = 0

            var characterSet: Set<Character> = .init()

            for rightIndex in 0..<s.count {
                let rightCharacter = characters[rightIndex]
                while characterSet.contains(rightCharacter) {
                    characterSet.remove(characters[leftIndex])
                    leftIndex += 1
                }

                characterSet.insert(rightCharacter)
                longestSequence = max(longestSequence, rightIndex - leftIndex + 1)
            }
            return longestSequence
        }
    }
}

/*
 let inputs = [
     ("abcabcbb", 3),
     ("pwwkew", 3),
     ("bbbbb", 1),
     ("dvdf", 3)
  ]

  inputs.forEach { (input, result) in
      let solution = __3.Solution()
      let output = solution.lengthOfLongestSubstring(input)

      print(output == result)
  }
 */
