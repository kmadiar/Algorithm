//
//  11_container_wth_most_water.swift
//  stop
//
//  Created by Kostiantyn Madiar on 15.07.2023.
//

import Foundation

/*
 11. Container With Most Water
 Medium
 You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

 Find two lines that together with the x-axis form a container, such that the container contains the most water.

 Return the maximum amount of water a container can store.

 Notice that you may not slant the container.



 Example 1:


 Input: height = [1,8,6,2,5,4,8,3,7]
 Output: 49
 Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
 Example 2:

 Input: height = [1,1]
 Output: 1


 Constraints:

 n == height.length
 2 <= n <= 105
 0 <= height[i] <= 104
 */

enum __11 {
    class Solution {
        func maxArea(_ height: [Int]) -> Int {
            var maxValue = 0
            var leftIndex = 0
            var rightIndex = height.count - 1
            while rightIndex > leftIndex {
                maxValue = max(maxValue, min(height[leftIndex], height[rightIndex]) * (rightIndex - leftIndex))
                if height[leftIndex] < height[rightIndex] {
                    leftIndex += 1
                } else {
                    rightIndex -= 1
                }
            }

            return maxValue
        }
    }
}
/*
let inputs = [
    ([1,8,6,2,5,4,8,3,7], 49),
 ]

 inputs.forEach { (input, result) in
     let solution = __11.Solution()
     let output = solution.maxArea(input)

     print(output == result)
 }
*/
