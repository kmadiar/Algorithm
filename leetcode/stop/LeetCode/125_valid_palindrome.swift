//
//  125_valid_palindrome.swift
//  stop
//
//  Created by Kostiantyn Madiar on 15.07.2023.
//

import Foundation

enum __125 {
    /*
     125. Valid Palindrome
     Easy
     A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

     Given a string s, return true if it is a palindrome, or false otherwise.



     Example 1:

     Input: s = "A man, a plan, a canal: Panama"
     Output: true
     Explanation: "amanaplanacanalpanama" is a palindrome.
     Example 2:

     Input: s = "race a car"
     Output: false
     Explanation: "raceacar" is not a palindrome.
     Example 3:

     Input: s = " "
     Output: true
     Explanation: s is an empty string "" after removing non-alphanumeric characters.
     Since an empty string reads the same forward and backward, it is a palindrome.


     Constraints:

     1 <= s.length <= 2 * 105
     s consists only of printable ASCII characters.
     */

    class Solution {
        func isPalindrome(_ s: String) -> Bool {
            let letters = CharacterSet.alphanumerics

            let array = Array<Character>(s.lowercased())

            var headIndex = 0
            var tailIndex = array.count - 1
            while (tailIndex - headIndex) > 0 {
                let headLetter = array[headIndex]
                guard contains(characterSet: letters,
                               character: headLetter) else {
                    headIndex += 1
                    continue
                }
                let tailLetter = array[tailIndex]
                guard contains(characterSet: letters,
                               character: tailLetter) else {
                    tailIndex -= 1
                    continue
                }

                guard headLetter == tailLetter else {
                    return false
                }
                headIndex += 1
                tailIndex -= 1
            }

            return true
        }

        func contains(characterSet: CharacterSet,
                      character: Character) -> Bool {
            character.unicodeScalars.allSatisfy(characterSet.contains)
        }
    }
}

/*
 let inputs = [
     ("A man, a plan, a canal: Panama", true),
     ("race a car", false),
     ("e a", false)
  ]

  inputs.forEach { (input, result) in
      let solution = __125.Solution()
      let output = solution.isPalindrome(input)

      print(output == result)
  }
 */
