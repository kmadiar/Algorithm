//
//  1962_remove_stones.swift
//  stop
//
//  Created by Kostiantyn Madiar on 28.12.2022.
//

import Foundation

enum __1962 {
    class Solution {
        func minStoneSum(_ piles: [Int], _ k: Int) -> Int {
            let powers = piles.map(powerOf)
            print(powers)
            return 0
        }

        func powerOf(_ input: Int) -> Int {
            var result = 0
            var input = input
            while input > 0 {
                input = input >> 1
                result += 1
            }
            return result
        }
    }
}

//let inputs = [
//    ([5,4,9], 2, 12),
//    ([4,3,6,7], 3, 12)
//]
//
//let something = [1, 2, 3, 4, 5, 6, 7, 8, 9, 16, 32, 33, 35, 64, 128, 129]
//
//inputs.forEach { input in
//    let solution = __1962.Solution()
//    let result = solution.minStoneSum(input.0, input.1)
//    print(result)
//}
