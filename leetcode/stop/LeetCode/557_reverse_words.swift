//
//  557_reverse_words.swift
//  stop
//
//  Created by Kostiantyn Madiar on 01/10/2023.
//

import Foundation

/*
 557. Reverse Words in a String III
 Easy
 Given a string s, reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.



 Example 1:

 Input: s = "Let's take LeetCode contest"
 Output: "s'teL ekat edoCteeL tsetnoc"
 Example 2:

 Input: s = "God Ding"
 Output: "doG gniD"


 Constraints:

 1 <= s.length <= 5 * 104
 s contains printable ASCII characters.
 s does not contain any leading or trailing spaces.
 There is at least one word in s.
 All the words in s are separated by a single space.
 */

enum __557 {
    class Solution {
        func reverseWords(_ s: String) -> String {
            var output: [Character] = []
            var stack: [Character] = []

            s.forEach { character in
                if character == " " {
                    while !stack.isEmpty {
                        output.append(stack.removeLast())
                    }
                    output.append(character)
                } else {
                    stack.append(character)
                }
            }

            while !stack.isEmpty {
                output.append(stack.removeLast())
            }

            return String(output)
        }
    }
}

/*
 let inputs = [
 //    ([1,1,1,2,2,3], 2),
 //    ([1], 1),
 //    ([4,1,-1,2,-1,2,3], 2)
     ([6, 0, 1, 4, 9, 7, -3, 1, -4, -8, 4, -7, -3, 3, 2, -3, 9, 5, -4, 0], 6)
 ]

 let expectations = [
 //    [1, 2],
 //    [1]
 //    [-1, 2]
     [-3,-4,0,1,4,9]
 ]
 let solution = __347.Solution()

 zip(inputs, expectations)
     .forEach { input, expected in

         let result = solution.topKFrequent(input.0, input.1)

         print(result == expected)
         print(result)
     }
 */
