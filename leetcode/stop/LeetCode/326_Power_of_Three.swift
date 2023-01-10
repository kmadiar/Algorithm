//
//  326_Power_of_Three.swift
//  stop
//
//  Created by Kostiantyn Madiar on 24.08.2022.
//

import Foundation

enum __326 {
    class Solution {
        func isPowerOfThree(_ n: Int) -> Bool {
            n > 0 && (1162261467 % n == 0)
        }
    }
}
