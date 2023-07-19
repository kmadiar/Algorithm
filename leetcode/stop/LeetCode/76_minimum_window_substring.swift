//
//  76_minimum_window_substring.swift
//  stop
//
//  Created by Kostiantyn Madiar on 17.07.2023.
//

import Foundation

/*
 76. Minimum Window Substring
 Hard
 Given two strings s and t of lengths m and n respectively, return the minimum window
 substring
  of s such that every character in t (including duplicates) is included in the window. If there is no such substring, return the empty string "".

 The testcases will be generated such that the answer is unique.



 Example 1:

 Input: s = "ADOBECODEBANC", t = "ABC"
 Output: "BANC"
 Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.
 Example 2:

 Input: s = "a", t = "a"
 Output: "a"
 Explanation: The entire string s is the minimum window.
 Example 3:

 Input: s = "a", t = "aa"
 Output: ""
 Explanation: Both 'a's from t must be included in the window.
 Since the largest window of s only has one 'a', return empty string.


 Constraints:

 m == s.length
 n == t.length
 1 <= m, n <= 105
 s and t consist of uppercase and lowercase English letters.


 Follow up: Could you find an algorithm that runs in O(m + n) time?
 */

enum __76 {
    class Solution {
        func minWindow(_ s: String, _ t: String) -> String {
            guard s.count >= t.count else { return "" }
            var tIndexMap: [Character: Int] = [:]
            for character in t {
                tIndexMap[character] = (tIndexMap[character] ?? 0) + 1
            }

            var leftIndex = 0
            var sIndexMap: [Character: Int] = [:]
            var result: (Int, Int)?
            var resultLength = Int.max

            var have = 0, need = tIndexMap.count

            for rightIndex in 0..<s.count {
                let rightStringIndex = s.index(s.startIndex, offsetBy: rightIndex)
                let rightCharacter = s[rightStringIndex]
                sIndexMap[rightCharacter] = (sIndexMap[rightCharacter] ?? 0) + 1

                if sIndexMap[rightCharacter] == tIndexMap[rightCharacter] {
                    have += 1
                }

                while have == need {
                    let leftCharacterIndex = s.index(s.startIndex, offsetBy: leftIndex)
                    let leftCharacter = s[leftCharacterIndex]

                    if (rightIndex - leftIndex + 1) < resultLength {
                        result = (leftIndex, rightIndex)
                        resultLength = rightIndex - leftIndex + 1
                    }
                    if let counter = sIndexMap[leftCharacter], counter > 1 {
                        sIndexMap[leftCharacter] = counter - 1
                    } else {
                        sIndexMap.removeValue(forKey: leftCharacter)
                    }

                    let sl = sIndexMap[leftCharacter] ?? 0
                    if let tl = tIndexMap[leftCharacter], sl < tl {
                        have -= 1
                    }

                    leftIndex += 1

                }
            }

            guard let result = result, resultLength != Int.max else {
                return ""
            }

            return String(s[s.index(s.startIndex, offsetBy: result.0)...s.index(s.startIndex, offsetBy: result.1)])
        }
    }
}

/*
 let inputs = [
     (("ADOBECODEBANC", "ABC"), "BANC"),
     (("a", "a"), "a"),
     (("a", "aa"), ""),
     (("cabwefgewcwaefgcf", "cae"), "cwae"),
     (("ab", "b"), "b"),
     (("aa", "aa"), "aa")
  ]

  inputs.forEach { (input, result) in
      let solution = __76.Solution()
      let output = solution.minWindow(input.0, input.1)

      print(output == result)
  }

 */
