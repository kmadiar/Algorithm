//
//  424_longest_repeating_character.swift
//  stop
//
//  Created by Kostiantyn Madiar on 17.07.2023.
//

import Foundation

/*

 424. Longest Repeating Character Replacement
 Medium
 You are given a string s and an integer k. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most k times.

 Return the length of the longest substring containing the same letter you can get after performing the above operations.



 Example 1:

 Input: s = "ABAB", k = 2
 Output: 4
 Explanation: Replace the two 'A's with two 'B's or vice versa.
 Example 2:

 Input: s = "AABABBA", k = 1
 Output: 4
 Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
 The substring "BBBB" has the longest repeating letters, which is 4.
 There may exists other ways to achive this answer too.


 Constraints:

 1 <= s.length <= 105
 s consists of only uppercase English letters.
 0 <= k <= s.length

 */

enum __424 {
    class Solution {
        var characterSet: [Character: Int] = [:]

        func characterReplacement(_ s: String, _ k: Int) -> Int {
            guard s.count > 1 else { return s.count }
            var leftIndex = 0
            var longestSequence = 0
            let characters: [Character] = Array(s)
            for rightIndex in 0..<s.count {
                let rightCharacter = characters[rightIndex]
                characterSet[rightCharacter] = (characterSet[rightCharacter] ?? 0) + 1
                while ((rightIndex - leftIndex + 1) - characterSet.values.max()!) > k {
                    let leftCharacter = characters[leftIndex]
                    characterSet[leftCharacter] = (characterSet[leftCharacter] ?? 0) - 1
                    leftIndex += 1
                }

                longestSequence = max(longestSequence, rightIndex - leftIndex + 1)
            }

            return longestSequence
        }
    }
}

/*

 let inputs = [
     (("ABAB", 2), 4),
     (("AABABBA", 1), 4),
  ]

  inputs.forEach { (input, result) in
      let solution = __424.Solution()
      let output = solution.characterReplacement(input.0, input.1)

      print(output == result)
  }
 */
