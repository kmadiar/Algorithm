//
//  climbing_stairs.swift
//  stop
//
//  Created by Kostiantyn Madiar on 17.07.2022.
//

import Foundation
// 746
enum __746 {
    class Solution {
        func minCostClimbingStairs(_ cost: [Int]) -> Int {
            var cost = cost
            cost.append(0)
            var prices: [Int] = cost
            guard cost.count > 2 else {
                return cost.min() ?? 0
            }

            prices[0] = cost[0]
            prices[1] = cost[1]

            var step = 2
            while step < cost.count {
                let cost = cost[step]
                prices[step] = min(prices[step - 1] + cost, prices[step - 2] + cost)
                step += 1
            }

            return prices.last ?? 0
        }
    }
}

//let stack = LinkedListStack()
//let queue = LinkedListQueue()
//
//let values: [Int] = [1,2,3,4,5,6,7,8,9,10]
//
//values.forEach {
//    stack.push(node: $0)
//    queue.push(node: $0)
//}
//
//while let item = stack.pop() {
//    print(item)
//}
//
//print("=================")
//
//while let item = queue.pop() {
//    print(item)
//}

//let steps = [10,15,20]

//print(Solution().minCostClimbingStairs(steps))

//let solution = Solution()
// ==================================
//print(solution.uniquePaths(3, 2))
//print(solution.uniquePaths(3, 7))
//print(solution.uniquePaths(23, 12))
// ==================================
