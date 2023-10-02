//
//  1791_find_center_of_graph.swift
//  stop
//
//  Created by Kostiantyn Madiar on 19/09/2023.
//

import Foundation

/*
 1791. Find Center of Star Graph

 Easy

 There is an undirected star graph consisting of n nodes labeled from 1 to n. A star graph is a graph where there is one center node and exactly n - 1 edges that connect the center node with every other node.

 You are given a 2D integer array edges where each edges[i] = [ui, vi] indicates that there is an edge between the nodes ui and vi. Return the center of the given star graph.



 Example 1:


 Input: edges = [[1,2],[2,3],[4,2]]
 Output: 2
 Explanation: As shown in the figure above, node 2 is connected to every other node, so 2 is the center.
 Example 2:

 Input: edges = [[1,2],[5,1],[1,3],[1,4]]
 Output: 1


 Constraints:

 3 <= n <= 105
 edges.length == n - 1
 edges[i].length == 2
 1 <= ui, vi <= n
 ui != vi
 The given edges represent a valid star graph.
 */

enum __1791 {
    class Solution {
        func findCenter(_ edges: [[Int]]) -> Int {
            var adjacencyList: [Int: [Int]] = [:]

            for edge in edges {
                if adjacencyList[edge[0]] != nil {
                    return edge[0]
                } else {
                    adjacencyList[edge[0]] = [edge[1]]
                }
                if adjacencyList[edge[1]] != nil {
                    return edge[1]
                } else {
                    adjacencyList[edge[1]] = [edge[0]]
                }
            }

            return 0
        }
    }
}
