//
//  452_minimum_number_of_arrows.swift
//  stop
//
//  Created by Kostiantyn Madiar on 05.01.2023.
//

import Foundation

/*
 452. Minimum Number of Arrows to Burst Balloons
 medium
 There are some spherical balloons taped onto a flat wall that represents the XY-plane. The balloons are represented as a 2D integer array points where points[i] = [xstart, xend] denotes a balloon whose horizontal diameter stretches between xstart and xend. You do not know the exact y-coordinates of the balloons.

 Arrows can be shot up directly vertically (in the positive y-direction) from different points along the x-axis. A balloon with xstart and xend is burst by an arrow shot at x if xstart <= x <= xend. There is no limit to the number of arrows that can be shot. A shot arrow keeps traveling up infinitely, bursting any balloons in its path.

 Given the array points, return the minimum number of arrows that must be shot to burst all balloons.
 */

enum __452 {
    class Solution {
        func findMinArrowShots(_ points: [[Int]]) -> Int {
            let sortedInput = points.sorted { left, right in
                left.last! < right.last!
            }

            guard sortedInput.count > 1 else { return sortedInput.count }
            var currentEnd = sortedInput[0][1]
            var output = 1
            for index in 1..<sortedInput.count {
                let next = sortedInput[index]
                let nextStart = next[0]
                if nextStart <= currentEnd {
                    continue
                } else {
                    output += 1
                    currentEnd = next[1]
                }
            }

            return output
        }

    }
}

//[
//    ([[10,16],[2,8],[1,6],[7,12]], 2),
//    ([[1,2],[3,4],[5,6],[7,8]], 4),
//    ([[1,2],[2,3],[3,4],[4,5]], 2),
//    ([[2,3],[2,3]], 1)
//].forEach { input, expected in
//    let output = __452.Solution().findMinArrowShots(input)
//    print(output)
//    print(output == expected)
//}
