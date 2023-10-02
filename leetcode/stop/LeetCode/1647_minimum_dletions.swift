//
//  1647_minimum_dletions.swift
//  stop
//
//  Created by Kostiantyn Madiar on 12/09/2023.
//

import Foundation

/*
 1647. Minimum Deletions to Make Character Frequencies Unique
 Medium
 A string s is called good if there are no two different characters in s that have the same frequency.

 Given a string s, return the minimum number of characters you need to delete to make s good.

 The frequency of a character in a string is the number of times it appears in the string. For example, in the string "aab", the frequency of 'a' is 2, while the frequency of 'b' is 1.



 Example 1:

 Input: s = "aab"
 Output: 0
 Explanation: s is already good.
 Example 2:

 Input: s = "aaabbbcc"
 Output: 2
 Explanation: You can delete two 'b's resulting in the good string "aaabcc".
 Another way it to delete one 'b' and one 'c' resulting in the good string "aaabbc".
 Example 3:

 Input: s = "ceabaacb"
 Output: 2
 Explanation: You can delete both 'c's resulting in the good string "eabaab".
 Note that we only care about characters that are still in the string at the end (i.e. frequency of 0 is ignored).


 Constraints:

 1 <= s.length <= 105
 s contains only lowercase English letters.
 */

enum __1647 {
    class Solution {
        func minDeletions(_ s: String) -> Int {
            var charactersMap: [Character: Int] = [:]
            var characters = Array(s)
            for characterIndex in 0..<s.count {
                let currentCharacter = characters[characterIndex]

                charactersMap[currentCharacter] = (charactersMap[currentCharacter] ?? 0) + 1
            }

            var values: [[Character]] = Array(repeating: [], count: s.count + 1)

            for (key, value) in charactersMap {
                var characters = values[value]
                characters.append(key)
                values[value] = characters
            }

            var output = 0

            for index in (0..<s.count).reversed() {
                var currentValues = values[index]
                if currentValues.isEmpty {
                    continue
                }

                while currentValues.count > 1 {
                    output += 1
                    let removedValue = currentValues.removeLast()
                    if (index - 1) > 0 {
                        values[index - 1].append(removedValue)
                    }
                }
            }

            return output
        }
    }
}
