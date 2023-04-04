//
//  57_insert_interval.swift
//  stop
//
//  Created by Kostiantyn Madiar on 16.01.2023.
//

import Foundation

/*

 57. Insert Interval
 medium

 You are given an array of non-overlapping intervals intervals where intervals[i] = [starti, endi] represent the start and the end of the ith interval and intervals is sorted in ascending order by starti. You are also given an interval newInterval = [start, end] that represents the start and end of another interval.

 Insert newInterval into intervals such that intervals is still sorted in ascending order by starti and intervals still does not have any overlapping intervals (merge overlapping intervals if necessary).

 Return intervals after the insertion.
 */


enum __57 {
    class Solution {
        func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
            guard !intervals.isEmpty else {
                return [newInterval]
            }
            var output: [[Int]] = []
            var newInterval = newInterval
            var isReady = false
            var index = 0
            while !isReady {
                if number(newInterval, isMore: intervals[index]) {
                    output.append(intervals[index])
                    index += 1
                    if index == intervals.count {
                        output.append(newInterval)
                        break
                    }
                    continue
                } else if number(newInterval, isLess: intervals[index]) {
                    output.append(newInterval)
                    isReady = true
                    continue // break the cycle
                }
                if number(newInterval, isIn: intervals[index]) ||
                    number(intervals[index], isIn: newInterval) {
                    newInterval = merge(newInterval: newInterval, withInterval: intervals[index])
                    if index == intervals.count - 1 {
                        output.append(newInterval)
                        isReady = true
                        index += 1
                        continue
                    }
                }
                if index == intervals.count - 1 {
                    isReady = true
                    continue
                }
                index += 1
            }

            for leftIndex in index..<intervals.count {
                output.append(intervals[leftIndex])
            }
            return output
        }

        func merge(newInterval: [Int], withInterval: [Int]) -> [Int] {
//            print("merge")
            let left = min(newInterval.min()!, withInterval.min()!)
            let right = max(newInterval.max()!, withInterval.max()!)

            return [left, right]
        }

        func number(_ number: [Int], isIn: [Int]) -> Bool {
            if number[0] >= isIn[0] && number[0] <= isIn[1] {
//                print("is in")
                return true
            }
            return false
        }

        func number(_ number: [Int], isMore: [Int]) -> Bool {
            if number[0] > isMore[1] {
//                print("is more")
                return true
            }

            return false
        }

        func number(_ number: [Int], isLess: [Int]) -> Bool {
            if number[0] < isLess[0] && number[1] < isLess[0] {
//                print("is less \(number) == \(isLess)")
                return true
            }

            return false
        }
    }
}

/*
 [
     ([[1,3],[6,9]], [2,5], [[1,5],[6,9]]),
     ([[1,2],[3,5],[6,7],[8,10],[12,16]], [4,8], [[1,2],[3,10],[12,16]]),
     ([], [5,7], [[5,7]]),
     ([[1,5]], [2,3], [[1,5]]),
     ([[1,5]], [6,8], [[1,5], [6,8]])
 ].forEach { intervals, newInterval, expected in
     let output = __57.Solution().insert(intervals, newInterval)
 //    print(output)
     print(output == expected)
 }
 */
