//
//  387_unique_character.swift
//  stop
//
//  Created by Kostiantyn Madiar on 16.08.2022.
//

import Foundation

enum __387 {
    class Solution {

        func firstUniqChar(_ s: String) -> Int {
            var letters = Dictionary<Character, Int>()
            let s2 = Array(s)
            s.forEach { character in
                if let letter = letters[character] {
                    letters[character] = letter + 1
                } else {
                    letters[character] = 1
                }
            }

            for i in 0..<s2.count {
                if letters[s2[i]] == 1 {
                    return i
                }
            }
            return -1
        }
    }
}
