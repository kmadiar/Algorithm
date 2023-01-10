//
//  520_detect_capital_letter.swift
//  stop
//
//  Created by Kostiantyn Madiar on 02.01.2023.
//

import Foundation

enum __520 {
    class Solution {
        func detectCapitalUse(_ word: String) -> Bool {
            word == word.lowercased().capitalized ||
            word.uppercased() == word ||
            word.lowercased() == word
        }
    }
}


//let inputs = [
//    ("USA", true),
//    ("FlaG", false)
//]
//
//inputs.forEach { string, expected in
//    let result = __520.Solution().detectCapitalUse(string)
//
//    print(expected == result)
//}
