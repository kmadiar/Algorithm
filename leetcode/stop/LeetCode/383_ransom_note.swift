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
            var ransomDict: [Character: Int] = [:]
            ransomNote.forEach { character in
                let count: Int = ransomDict[character] ?? 0
                ransomDict[character] = count + 1
            }

            var magasizeDict: [Character: Int] = [:]

            magazine.forEach { character in
                let count: Int = magasizeDict[character] ?? 0
                magasizeDict[character] = count + 1
            }

            for key in ransomDict.keys {
                guard ransomDict[key] == magasizeDict[key] else {
                    return false
                }
            }

            return true
        }
    }
}

//let solution383 = __383.Solution()
//print(solution383.canConstruct("a", "b"))
//print(solution383.canConstruct("aa", "ab"))
//print(solution383.canConstruct("aa", "aab"))
