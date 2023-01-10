//
//  134_gas_Station.swift
//  stop
//
//  Created by Kostiantyn Madiar on 07.01.2023.
//

import Foundation

/*
 134. Gas Station
 There are n gas stations along a circular route, where the amount of gas at the ith station is gas[i].

 You have a car with an unlimited gas tank and it costs cost[i] of gas to travel from the ith station to its next (i + 1)th station. You begin the journey with an empty tank at one of the gas stations.

 Given two integer arrays gas and cost, return the starting gas station's index if you can travel around the circuit once in the clockwise direction, otherwise return -1. If there exists a solution, it is guaranteed to be unique
 */

enum __134 {
    class Solution {
        func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
            var profit = 0
            var debt = 0
            var outputIndex = 0

            for index in 0..<gas.count {
                profit += gas[index] - cost[index]

                if profit < 0 {
                    debt += profit
                    profit = 0
                    outputIndex = index + 1
                }
            }

            return profit + debt >= 0 ? outputIndex : -1
        }
    }
}

/*
 [
     ([5,1,2,3,4], [4,4,1,5,1], 4),
     ([1,2,3,4,5], [3,4,5,1,2], 3),
     ([2,3,4], [3,4,3], -1),
     ([1,2,3,4,5,5,70], [2,3,4,3,9,6,2], 6)
 ].forEach { gas, cost, expected in
     let output = __134.Solution().canCompleteCircuit(gas, cost)
     print(output)
     print(output == expected)
 }
 */
