//
//  __343_integer_break.swift
//  stop
//
//  Created by Kostiantyn Madiar on 06/10/2023.
//

import Foundation

enum __343 {
    /*
     343. Integer Break

     Medium
     Given an integer n, break it into the sum of k positive integers, where k >= 2, and maximize the product of those integers.

     Return the maximum product you can get.



     Example 1:

     Input: n = 2
     Output: 1
     Explanation: 2 = 1 + 1, 1 × 1 = 1.
     Example 2:

     Input: n = 10
     Output: 36
     Explanation: 10 = 3 + 3 + 4, 3 × 3 × 4 = 36.


     Constraints:

     2 <= n <= 58
     */
    class Solution {
        func integerBreak(_ n: Int) -> Int {
            var cache: [Int : Int] = [:]
            cache[1] = 1


            for number in 2..<n+1 {
                cache[number] = number == n ? 0 : number

                for i in 1..<number {
                    let value = cache[i]! * cache[number - i]!
                    cache[number] = max(cache[number]!, value)

                }
            }

            return cache[n]!
        }
    }
}
