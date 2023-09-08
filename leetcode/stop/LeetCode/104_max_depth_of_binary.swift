//
//  104_max_depth_of_binary.swift
//  stop
//
//  Created by Kostiantyn Madiar on 21.07.2023.
//

import Foundation

/*
 104. Maximum Depth of Binary Tree
 Easy
 Given the root of a binary tree, return its maximum depth.

 A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.



 Example 1:


 Input: root = [3,9,20,null,null,15,7]
 Output: 3
 Example 2:

 Input: root = [1,null,2]
 Output: 2


 Constraints:

 The number of nodes in the tree is in the range [0, 104].
 -100 <= Node.val <= 100
 */

enum __104 {
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
        var maxDepth = 0
        func maxDepth(_ root: TreeNode?) -> Int {
            dfs(root, depth: maxDepth)
            return maxDepth
        }

        func dfs(_ node: TreeNode?, depth: Int) {
            guard node != nil else { return }
            let newDepth = depth + 1
            maxDepth = max(maxDepth, newDepth)
            dfs(node?.left, depth: newDepth)
            dfs(node?.right, depth: newDepth)
        }
    }
}
