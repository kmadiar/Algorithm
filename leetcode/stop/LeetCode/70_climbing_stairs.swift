//
//  70_climbing_stairs.swift
//  stop
//
//  Created by Kostiantyn Madiar on 12.12.2022.
//

import Foundation

enum __70 {
    class Solution {
        var steps: [Int] = []
        func climbStairs(_ n: Int) -> Int {
            guard n > 1 else { return 1 }
            steps.append(1)
            steps.append(2)

            for step in 2 ..< n {
                steps.append(steps[step - 1] + steps[step - 2])
            }

            return steps[n - 1]
        }
    }
}

//(1...10).forEach { step in
//    let solution = __70.Solution()
//    print("\(step) = \(solution.climbStairs(step))")
//}
//
