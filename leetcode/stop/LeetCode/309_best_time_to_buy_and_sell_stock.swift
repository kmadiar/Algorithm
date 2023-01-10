//
//  309_best_time_to_buy_and_sell_stock.swift
//  stop
//
//  Created by Kostiantyn Madiar on 23.12.2022.
//

import Foundation

enum __309 {
    class Solution {
        func maxProfit(_ prices: [Int]) -> Int {
            var sold = 0, hold = Int.min, res = 0
            for index in 0..<prices.count {
                var previous = sold
                sold = hold + prices[index]
                hold = max(res, previous)
            }

            return max(sold, res)
        }
    }
}

//let inputs = [
//    ([1,2,3,0,2], 3),
//    ([1], 0)
//]
//
//inputs.forEach { input in
//    let solution = __309.Solution()
//    let result = solution.maxProfit(input.0)
//    print(result)
//    print(result == input.1)
//}
