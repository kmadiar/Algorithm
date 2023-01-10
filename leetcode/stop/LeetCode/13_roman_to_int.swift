//
//  13_roman_to_int.swift
//  stop
//
//  Created by Kostiantyn Madiar on 15.08.2022.
//

import Foundation

enum __13 {
    class Solution {
        func romanToInt(_ s: String) -> Int {
            var arr = Array(s.reversed())
            let map: [String: Int] = [
                "I": 1,
                "IV": 4,
                "V": 5,
                "IX": 9,
                "X": 10,
                "XL": 40,
                "L": 50,
                "XC": 90,
                "C": 100,
                "CD": 400,
                "D": 500,
                "CM": 900,
                "M": 1000
            ]
            var result = 0
            var current: String = ""
            var head = 0
            while head < arr.count {
                current.append(arr[head])
                head += 1
                if current.count == 2 {
                    if let value = map[String(current.reversed())] {
                        result += value
                        current = ""
                    } else {
                        if let first = current.first {
                            result += map[String(first)] ?? 0
                        }
                        current.removeFirst()
                    }
                }
            }
            result += map[current] ?? 0
            return result
        }
    }
}
