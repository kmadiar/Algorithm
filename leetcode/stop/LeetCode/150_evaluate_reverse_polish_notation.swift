//
//  150_evaluate_reverse_polish_notation.swift
//  stop
//
//  Created by Kostiantyn Madiar on 17.12.2022.
//

import Foundation

enum __150 {
    class Solution {
        var stack: [Token] = []
        func parse(_ token: String) -> Token {
            if let value = Int(token) {
                return .value(value)
            }

            switch token {
            case "*":
                return .op(.mult)
            case "/":
                return .op(.divide)
            case "+":
                return .op(.plus)
            case "-":
                return .op(.minus)
            default:
                fatalError("unsupported token")
            }
        }

        enum Operator {
            case plus
            case minus
            case mult
            case divide

            func apply(left: Int, right: Int) -> Int
            {
                switch self {
                case .plus:
                    return left + right
                case .minus:
                    return left - right
                case .mult:
                    return left * right
                case .divide:
                    return left / right
                }
            }
        }

        enum Token {
            case op(Operator)
            case value(Int)
        }

        func eval(_ stack: inout [Token]) -> Int {
            let token = stack.removeLast()
            switch token {
            case let .op(op):
                let right = eval(&stack)
                let left = eval(&stack)
                return op.apply(left: left, right: right)
            case let .value(value):
                return value
            }
        }

        func evalRPN(_ tokens: [String]) -> Int {
            self.stack = tokens.map(parse)
            var input = stack
            return eval(&input)
        }
    }
}


//let inputs = [
//    (["2","1","+","3","*"], 9),
//    (["4","13","5","/","+"], 6),
//    (["10","6","9","3","+","-11","*","/","*","17","+","5","+"], 22)
//]
//
//inputs.forEach { input in
//    let solution = __150.Solution()
//    let output = solution.evalRPN(input.0)
//    print(output)
//    print(output == input.1)
//}
