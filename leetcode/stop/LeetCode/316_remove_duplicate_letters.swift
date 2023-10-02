//
//  316_remove_duplicate_letters.swift
//  stop
//
//  Created by Kostiantyn Madiar on 26/09/2023.
//

import Foundation

/*
 316. Remove Duplicate Letters
 Medium
 Given a string s, remove duplicate letters so that every letter appears once and only once. You must make sure your result is
 the smallest in lexicographical order
  among all possible results.



 Example 1:

 Input: s = "bcabc"
 Output: "abc"
 Example 2:

 Input: s = "cbacdcbc"
 Output: "acdb"


 Constraints:

 1 <= s.length <= 104
 s consists of lowercase English letters.


 Note: This question is the same as 1081: https://leetcode.com/problems/smallest-subsequence-of-distinct-characters/
 */

enum __316 {
    class Solution {
        func removeDuplicateLetters(_ s: String) -> String {
            var stringMap: [Character: Int] = [:]
            var added: Set<Character> = .init()
            var stack: [Character] = []
            s.forEach { character in
                stringMap[character] = (stringMap[character] ?? 0) + 1
            }
            
            func add(_ character: Character) {
                added.insert(character)
                stack.append(character)
                print("adding \(character)")
            }

            func remove(_ character: Character) {
                stack.removeLast()
                added.remove(character)
                print("removing \(character)")
            }

            s.forEach { character in
                guard !added.contains(character) else {
                    stringMap[character] = stringMap[character]! - 1
                    return
                }
                while let peekValue = stack.last,
                      peekValue >= character,
                      stringMap[peekValue]! > 0 {
                    remove(peekValue)
                }

                add(character)
                stringMap[character] = stringMap[character]! - 1
            }

            return String(stack)
        }
    }
}

/*
 let inputs = [
 //    "bcabc",
 //    "cbacdcbc",
 //    "ecbacba",
 //    "cdadabcc",
 //    "bbcaac",
 //    "bcabc",
     "abacb"
 ]

 let expectations = [
 //    "abc",
 //    "acdb",
 //    "eacb",
 //    "adbc",
 //    "bac",
 //    "abc",
     "abc"
 ]

 let solution = __316.Solution()

 zip(inputs, expectations)
     .forEach { input, expected in
         let result = solution.removeDuplicateLetters(input)

 //        print(result == expected)
         print(result)
     }

 */
