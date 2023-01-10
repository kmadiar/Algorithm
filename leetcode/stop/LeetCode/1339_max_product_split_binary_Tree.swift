//
//  1339_max_product_split_binary_Tree.swift
//  stop
//
//  Created by Kostiantyn Madiar on 10.12.2022.
//

import Foundation

enum __1339 {
    class Solution {
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

        var sum: UInt = 0
        var maxProd: UInt = 0

        func visit(_ node: TreeNode?) {
            guard let node = node else { return }
            sum += UInt(node.val)
            visit(node.left)
            visit(node.right)
        }

        func checkMax(_ node: TreeNode?) -> UInt {
            guard let node = node else { return 0}
            let left = checkMax(node.left)
            let right = checkMax(node.right)
            maxProd = max(maxProd, (left + right + UInt(node.val)) * (sum - left - right - UInt(node.val)))

            return left + right + UInt(node.val)
        }

        func maxProduct(_ root: TreeNode?) -> Int {
            visit(root)

            let rootProd = checkMax(root)
            return Int(maxProd % 1000000007)
        }
    }
}
