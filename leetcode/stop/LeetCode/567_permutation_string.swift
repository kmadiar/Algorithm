//
//  567_permutation_string.swift
//  stop
//
//  Created by Kostiantyn Madiar on 17.07.2023.
//

import Foundation

/*
 567. Permutation in String
 Medium
 Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.

 In other words, return true if one of s1's permutations is the substring of s2.



 Example 1:

 Input: s1 = "ab", s2 = "eidbaooo"
 Output: true
 Explanation: s2 contains one permutation of s1 ("ba").
 Example 2:

 Input: s1 = "ab", s2 = "eidboaoo"
 Output: false


 Constraints:

 1 <= s1.length, s2.length <= 104
 s1 and s2 consist of lowercase English letters.

 */

enum __567 {
    class Solution {
        func checkInclusion(_ s1: String, _ s2: String) -> Bool {
            guard s1.count <= s2.count else { return false }
            var s1CharacterMap: [Character: Int] = [:]
            for character in s1 {
                s1CharacterMap[character] = (s1CharacterMap[character] ?? 0) + 1
            }

            var s2CharacterMap: [Character: Int] = [:]

            var leftIndex = 0
            let characters2 = Array(s2)
            for rightIndex in 0..<s2.count {
                let rightLetter = characters2[rightIndex]
                s2CharacterMap[rightLetter] = (s2CharacterMap[rightLetter] ?? 0) + 1

                if rightIndex < s1.count - 1 {
                    continue
                }
                if s1CharacterMap == s2CharacterMap {
                    return true
                }
                // if maps aren't the same
                let leftLetter = characters2[leftIndex]

                if let value = s2CharacterMap[leftLetter], value > 1 {
                    s2CharacterMap[leftLetter] = value - 1
                } else {
                    s2CharacterMap.removeValue(forKey: leftLetter)
                }

                leftIndex += 1
            }

            return false
        }
    }
}

/*

 let inputs = [
     (("ab", "eidbaooo"), true),
     (("ab", "eidboaoo"), false),
     (("adc", "dcda"), true)
  ]

  inputs.forEach { (input, result) in
      let solution = __567.Solution()
      let output = solution.checkInclusion(input.0, input.1)

      print(output == result)
  }

 */
