//
//  242_anagram.swift
//  stop
//
//  Created by Kostiantyn Madiar on 03.07.2023.
//

import Foundation

enum __242 {
    /* easy
     Given two strings s and t, return true if t is an anagram of s, and false otherwise.

     An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.



     Example 1:

     Input: s = "anagram", t = "nagaram"
     Output: true
     Example 2:

     Input: s = "rat", t = "car"
     Output: false


     Constraints:

     1 <= s.length, t.length <= 5 * 104
     s and t consist of lowercase English letters.


     Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?
     */
    class Solution {
        func isAnagram(_ s: String, _ t: String) -> Bool {
            s.sorted() == t.sorted()
        }
    }
}
