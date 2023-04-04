//
//  412_fizz_buzz.swift
//  stop
//
//  Created by Kostiantyn Madiar on 04.04.2023.
//

import Foundation

enum __412 {
    class Solution {
        func fizzBuzz(_ n: Int) -> [String] {
            var output: Array<String> = []
            for i in 1...n {
                let div3 = i % 3 == 0
                let div5 = i % 5 == 0

                let answer: String

                if div3 && div5 {
                    answer = "FizzBuzz"
                } else if div3 {
                    answer = "Fizz"
                } else if div5 {
                    answer = "Buzz"
                } else {
                    answer = "\(i)"
                }

                output.append(answer)
            }

            return output
        }
    }
}
