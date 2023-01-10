//
//  414_third_max_number.swift
//  stop
//
//  Created by Kostiantyn Madiar on 10.12.2022.
//

import Foundation

enum __414 {
    class Solution {
        func thirdMax(_ nums: [Int]) -> Int {
            let output = Set(nums).sorted(by: >)
            guard output.count > 2 else { return output.first ?? 0 }
            return output[2]
        }
    }
}
