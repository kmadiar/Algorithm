//
//  232_implement_queue_using_stacks.swift
//  stop
//
//  Created by Kostiantyn Madiar on 17.12.2022.
//

import Foundation

enum __232 {
    class MyQueue {

        var input = [Int]()
        var output = [Int]()

        func push(_ x: Int) {
            input.append(x)
        }

        func pop() -> Int {
            peek()
            return output.removeLast()
        }

        @discardableResult
        func peek() -> Int {
            if output.isEmpty {
                while !input.isEmpty {
                    output.append(input.removeLast())
                }
            }
            return output.last ?? 0
        }

        func empty() -> Bool {
            return input.isEmpty && output.isEmpty
        }
    }
}
