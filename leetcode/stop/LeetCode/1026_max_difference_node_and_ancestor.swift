//
//  1026_max_difference_node_and_ancestor.swift
//  stop
//
//  Created by Kostiantyn Madiar on 09.12.2022.
//

import Foundation

enum __1026 {
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
        func maxAncestorDiff(_ root: TreeNode?) -> Int {
            guard let root = root else {
                return 0
            }

            return visit(root, curMax: root.val, curMin: root.val)
        }

        func visit(_ node: TreeNode?, curMax: Int, curMin: Int) -> Int {
            guard let node = node else {
                return curMax - curMin
            }

            var curMax = curMax
            var curMin = curMin

            curMax = max(curMax, node.val)
            curMin = min(curMin, node.val)
            let left = visit(node.left, curMax: curMax, curMin: curMin)
            let right = visit(node.right, curMax: curMax, curMin: curMin)

            return max(left, right)
        }
    }
}
