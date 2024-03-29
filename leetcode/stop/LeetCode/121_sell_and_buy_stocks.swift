//
//  121_sell_and_buy_stocks.swift
//  stop
//
//  Created by Kostiantyn Madiar on 16.07.2023.
//

import Foundation

/*
 121. Best Time to Buy and Sell Stock
 Easy
 You are given an array prices where prices[i] is the price of a given stock on the ith day.

 You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

 Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.



 Example 1:

 Input: prices = [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
 Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
 Example 2:

 Input: prices = [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transactions are done and the max profit = 0.


 Constraints:

 1 <= prices.length <= 105
 0 <= prices[i] <= 104
 */

enum __121 {
    class Solution {
        func maxProfit(_ prices: [Int]) -> Int {
            guard !prices.isEmpty else { return 0 }
            var minimum = prices[0]
            var maximum = prices[0]
            var maxProfit = maximum - minimum
            for price in prices {
                if price <= minimum {
                    minimum = price
                    maximum = price
                } else {
                    maximum = max(price, maximum)
                }
                maxProfit = max(maxProfit, maximum - minimum)
            }

            return maxProfit
        }
    }
}

/*
 let inputs = [
     ([7,1,5,3,6,4], 5),
     ([7,6,4,3,1], 0),
     ([2,4,1], 2)
  ]

  inputs.forEach { (input, result) in
      let solution = __121.Solution()
      let output = solution.maxProfit(input)

      print(output == result)
  }
 */
