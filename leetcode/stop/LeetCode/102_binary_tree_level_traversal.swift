//
//  102_binary_tree_level_traversal.swift
//  stop
//
//  Created by Kostiantyn Madiar on 22.07.2023.
//

import Foundation

/*
 102. Binary Tree Level Order Traversal
 Medium
 Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

 Example 1:

 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[9,20],[15,7]]
 Example 2:

 Input: root = [1]
 Output: [[1]]
 Example 3:

 Input: root = []
 Output: []


 Constraints:

 The number of nodes in the tree is in the range [0, 2000].
 -1000 <= Node.val <= 1000
 */

enum __102 {
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init() { self.val = 0; self.left = nil; self.right = nil; }
        public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }

    class Solution {
        var output: [[Int]] = []
        var queue: [TreeNode] = []
        func levelOrder(_ root: TreeNode?) -> [[Int]] {
            guard let root = root else { return [] }
            queue.append(root)

            while !queue.isEmpty {
                var level: [Int] = []

                for _ in 0..<queue.count {
                    let current = queue.removeFirst()
                    level.append(current.val)

                    if let left = current.left {
                        queue.append(left)
                    }
                    if let right = current.right {
                        queue.append(right)
                    }
                }
                output.append(level)
            }
            return output
        }
    }
}
