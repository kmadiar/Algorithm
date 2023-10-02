//
//  135_candy.swift
//  stop
//
//  Created by Kostiantyn Madiar on 13/09/2023.
//

import Foundation

/*
 135. Candy
 Hard
 There are n children standing in a line. Each child is assigned a rating value given in the integer array ratings.

 You are giving candies to these children subjected to the following requirements:

 Each child must have at least one candy.
 Children with a higher rating get more candies than their neighbors.
 Return the minimum number of candies you need to have to distribute the candies to the children.



 Example 1:

 Input: ratings = [1,0,2]
 Output: 5
 Explanation: You can allocate to the first, second and third child with 2, 1, 2 candies respectively.
 Example 2:

 Input: ratings = [1,2,2]
 Output: 4
 Explanation: You can allocate to the first, second and third child with 1, 2, 1 candies respectively.
 The third child gets 1 candy because it satisfies the above two conditions.


 Constraints:

 n == ratings.length
 1 <= n <= 2 * 104
 0 <= ratings[i] <= 2 * 104
 */
enum __135 {
    class Solution {
        func candy(_ ratings: [Int]) -> Int {
            var cache: [Int] = Array(repeating: 1, count: ratings.count)

            let range = 0..<ratings.count
            for index in range {
                let previous = (index - 1) < 0 ? ratings[index] : ratings[index - 1]

                if ratings[index] > previous {
                    cache[index] = max(cache[index], cache[index - 1] + 1)
                }
            }

            for index in range.reversed() {
                let next = (index + 1) == ratings.count ? ratings[index] : ratings[index + 1]

                if ratings[index] > next {
                    cache[index] = max(cache[index], cache[index + 1] + 1)
                }
            }

            return cache.reduce(0, +)
        }
    }
}

/*
 [2, 3, 6, 6, 6, 4, 2]
 */
