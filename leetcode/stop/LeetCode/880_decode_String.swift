//
//  880_decode_String.swift
//  stop
//
//  Created by Kostiantyn Madiar on 27/09/2023.
//

import Foundation

enum __880 {
    class Solution {
        func decodeAtIndex(_ s: String, _ k: Int) -> String {
            var k = k
            let characters: [Character] = Array(s)
            var totalLength = 0
            for currentIndex in 0..<characters.count  {
                let currentCharacter = characters[currentIndex]
                if let intValue = Int(String(currentCharacter)) {
                    // process digit
                    totalLength *= intValue
                } else {
                    totalLength += 1
                }
            }

            for index in (0..<characters.count).reversed() {
                let currentCharacter = characters[index]
                k %= totalLength
                if (k == 0 || k == totalLength) && !isDigit(currentCharacter) {
                    return String(currentCharacter)
                }

                if let intValue = Int(String(currentCharacter)) {
                    totalLength /= intValue
                } else {
                    totalLength -= 1
                }
            }

            return ""
        }

        func isDigit(_ character: Character) -> Bool {
            Int(String(character)) != nil
        }
    }
}

/*

 let inputs = [
 //    ("leet2code3", 10),
     ("ha22", 5),
 //    ("a2345678999999999999999", 1),
 //    ("y959q969u3hb22odq595", 222280369)
 ]

 let expectations = [
 //    "o",
     "h",
 //    "a",
 //    "y"
 ]

 zip(inputs, expectations)
     .forEach { input, expected in
         let result = __880.Solution().decodeAtIndex(input.0, input.1)
         print(result == expected)
     }
 */
