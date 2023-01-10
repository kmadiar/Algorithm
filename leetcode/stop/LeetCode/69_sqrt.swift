//
//  69_sqrt.swift
//  stop
//
//  Created by Kostiantyn Madiar on 03.08.2022.
//

import Foundation

enum __69 {
    class Solution {
        var tried: Set<Int> = .init()
        func mySqrt(_ x: Int) -> Int {
            if x == 1 { return 1 }
            tried.removeAll()
            return visit(left: 0, right: x, x: x)
        }

        func visit(left: Int, right: Int, x: Int) -> Int {
            let median = (left + right) / 2
            let square = median * median
            if tried.contains(median) {
                return median
            }
            tried.insert(median)
            if square == x {
                return median
            }
            if square > x {

                return visit(left: left, right: median, x: x)
            }
            // square < x
            if x - square == 1 {
                return median
            }
            return visit(left: median, right: right, x: x)
        }
    }
}
