//
//  938_range_sum_of_BST.swift
//  stop
//
//  Created by Kostiantyn Madiar on 07.12.2022.
//

import Foundation

enum __938 {
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
        func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
            visit(root, low: low, high: high)
        }

        func visit(_ node: TreeNode?, low: Int, high: Int) -> Int {
            guard let node = node else { return 0 }

            let value = (node.val <= high) && (node.val >= low) ? node.val : 0
            return visit(node.left, low: low, high: high)
            + value
            + visit(node.right, low: low, high: high)
        }
    }
}
