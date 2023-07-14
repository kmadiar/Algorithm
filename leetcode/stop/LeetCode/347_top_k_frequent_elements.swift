//
//  347_top_k_frequent_elements.swift
//  stop
//
//  Created by Kostiantyn Madiar on 13.07.2023.
//

import Foundation

enum __347 {
    /*
     Top K Frequent Elements
     Medium
     Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.
     */
    class Solution {
        func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
            var hashMap: Dictionary<Int, Int> = [:] // create a hash map
            for number in nums {
                let value = hashMap[number] ?? 0
                hashMap[number] = value + 1 // count number of occurrences for each element
            }
            return hashMap
                .sorted { $0.1 > $1.1 } // sort by number of occurrence
                .prefix(k)              // take first k results
                .map { $0.0 }           // take key which is the number from nums
        }
    }
}
