//
//  383_ransom_note.swift
//  stop
//
//  Created by Kostiantyn Madiar on 25.08.2022.
//

import Foundation

enum __383 {
    class Solution {
        func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {

            var magazineDict: [Character: Int] = [:]

            magazine.forEach { character in
                let count: Int = magazineDict[character] ?? 0
                magazineDict[character] = count + 1
            }

            for character in ransomNote {
                let count: Int = magazineDict[character] ?? 0
                guard count > 0 else {
                    return false
                }
                magazineDict[character] = count - 1
            }


            return true
        }
    }
}

//let solution383 = __383.Solution()
//print(solution383.canConstruct("a", "b"))
//print(solution383.canConstruct("aa", "ab"))
//print(solution383.canConstruct("aa", "aab"))
