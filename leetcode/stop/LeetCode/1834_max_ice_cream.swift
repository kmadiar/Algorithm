//
//  1834_max_ice_cream.swift
//  stop
//
//  Created by Kostiantyn Madiar on 06.01.2023.
//

import Foundation

/*
 1833. Maximum Ice Cream Bars
 medium
 It is a sweltering summer day, and a boy wants to buy some ice cream bars.

 At the store, there are n ice cream bars. You are given an array costs of length n, where costs[i] is the price of the ith ice cream bar in coins. The boy initially has coins coins to spend, and he wants to buy as many ice cream bars as possible.

 Return the maximum number of ice cream bars the boy can buy with coins coins.

 Note: The boy can buy the ice cream bars in any order.
 */

enum __1834 {
    class Solution {
        func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
            let sorted = costs.sorted()
            var output = 0
            var sum = 0
            for index in 0..<sorted.count {
                let element = sorted[index]
                if sum + element <= coins {
                    sum += element
                    output += 1
                } else {
                    break
                }
            }

            return output
        }
    }
}
