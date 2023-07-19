//
//  22_generate_parentheses.swift
//  stop
//
//  Created by Kostiantyn Madiar on 18.07.2023.
//

import Foundation

/*

 22. Generate Parentheses
 Medium
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.



 Example 1:

 Input: n = 3
 Output: ["((()))","(()())","(())()","()(())","()()()"]
 Example 2:

 Input: n = 1
 Output: ["()"]


 Constraints:

 1 <= n <= 8

 */

enum __22 {
    class Solution {
        func generateParenthesis(_ n: Int) -> [String] {
            var stack: [String] = []
            var result: [String] = []

            func backtrack(openN: Int, closedN: Int) {
                if openN == closedN && closedN == n {
                    result.append(stack.joined())
                    return
                }

                if openN < n {
                    stack.append("(")
                    backtrack(openN: openN + 1, closedN: closedN)
                    _ = stack.popLast()
                }

                if closedN < openN {
                    stack.append(")")
                    backtrack(openN: openN, closedN: closedN + 1)
                    _ = stack.popLast()
                }
            }

            backtrack(openN: 0, closedN: 0)

            return result
        }
    }
}

/*
 let inputs = [
     (3, ["((()))","(()())","(())()","()(())","()()()"])
  ]

  inputs.forEach { (input, result) in
      let solution = __22.Solution()
      let output = solution.generateParenthesis(input)

      print(output == result)
  }
 */
