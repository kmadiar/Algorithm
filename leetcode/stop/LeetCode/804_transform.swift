//
//  804_transform.swift
//  stop
//
//  Created by Kostiantyn Madiar on 18.08.2022.
//

import Foundation

enum __804 {
    class Solution {
        func uniqueMorseRepresentations(_ words: [String]) -> Int {

            var output: Set<String> = []

            words.forEach { word in
                var result = ""
                word.forEach { letter in
                    result += letters[letter] ?? ""
                }
                output.insert(result)
            }

            return output.count
        }

        let letters: [Character: String] = ["a":".-",
             "b":"-...",
             "c":"-.-.",
             "d":"-..",
             "e":".",
             "f":"..-.",
             "g":"--.",
             "h":"....",
             "i":"..",
             "j":".---",
             "k":"-.-",
             "l":".-..",
             "m":"--",
             "n":"-.",
             "o":"---",
             "p":".--.",
             "q":"--.-",
             "r":".-.",
             "s":"...",
             "t":"-",
             "u":"..-",
             "v":"...-",
             "w":".--",
             "x":"-..-",
             "y":"-.--",
             "z":"--.."]
    }
}

//let solution804 = __804.Solution()
//
//solution804.uniqueMorseRepresentations(["asdfsdf"])

//let solution342 = __342.Solution()
//
//for x in 0...120 {
//    if solution342.isPowerOfFour(x) {
//        print("\(x) is power \(solution342.isPowerOfFour(x))")
//    }
//}
//for x in 0...10 {
//print(pow(4, x))
//}
