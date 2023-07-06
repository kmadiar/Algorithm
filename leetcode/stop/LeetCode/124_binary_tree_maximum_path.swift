//
//  124_binary_tree_maximum_path.swift
//  stop
//
//  Created by Kostiantyn Madiar on 11.12.2022.
//

import Foundation

enum __124 {

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
        var maxSum: Int = .min
        func maxPathSum(_ root: TreeNode?) -> Int {
            visit(root)
            return maxSum
        }

        @discardableResult
        func visit(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            let left = max(visit(node.left), 0)
            let right = max(visit(node.right), 0)
            maxSum = max(maxSum, left + right + node.val)
            return max(left + node.val, right + node.val)
        }
    }
}
