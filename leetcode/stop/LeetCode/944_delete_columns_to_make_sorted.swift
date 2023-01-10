//
//  944_delete_columns_to_make_sorted.swift
//  stop
//
//  Created by Kostiantyn Madiar on 03.01.2023.
//

import Foundation

enum __944 {
    class Solution {
        func minDeletionSize(_ strs: [String]) -> Int {
            let height = strs.count
            let length = strs[0].count
            var result = 0
            for column in 0..<length {
                let element = Array(strs[0])
                var current: Character = element[column]
                for row in 1..<height {
                    let next = Array(strs[row])[column]
                    if next < current {
                        result += 1
                        break
                    }
                    current = next
                }
            }
            return result
        }
    }
}

//let inputs = [
//    (["cba","daf","ghi"], 1),
//    (["a","b"], 0),
//    (["zyx","wvu","tsr"], 3),
//    (["rrjk","furt","guzm"], 2),
//    (["qowfc","spyge","sqbif","vvrkk"], 1)
//]
//
//inputs.forEach { (input, expected) in
//    let result = __944.Solution().minDeletionSize(input)
//    print(result)
//    print(result == expected)
//}
