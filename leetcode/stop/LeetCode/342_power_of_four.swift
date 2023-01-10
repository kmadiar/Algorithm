//
//  342_power_of_four.swift
//  stop
//
//  Created by Kostiantyn Madiar on 22.08.2022.
//

import Foundation

enum __342 {
    class Solution {
        func isPowerOfFour(_ n: Int) -> Bool {
            (n > 0) && (n & (n - 1) == 0) && (n&1431655765 == n)
        }
    }
}
