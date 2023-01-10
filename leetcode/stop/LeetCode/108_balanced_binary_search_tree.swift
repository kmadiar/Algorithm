//
//  108_balanced_binary_search_tree.swift
//  stop
//
//  Created by Kostiantyn Madiar on 10.08.2022.
//

import Foundation

enum __108 {
    class Solution {
        var head: TreeNode?
        func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
            guard !nums.isEmpty else {
                return nil
            }
            visit(nums: nums, left: 0, right: nums.count)
            if let first = nums.first {
                insert(first)
            }
            return head
        }

        func insert(_ value: Int) {
            if let head = head {
                insert(value, node: head)
                return
            }
            head = TreeNode(value)
        }

        func insert(_ value: Int, node: TreeNode) {
            if value > node.val {
                if let right = node.right {
                    insert(value, node: right)
                    return
                } else {
                    node.right = .init(value)
                    return
                }
            }
            if value < node.val {
                if let left = node.left {
                    insert(value, node: left)
                    return
                } else {
                    node.left = .init(value)
                    return
                }
            }
        }

        func visit(nums: [Int], left: Int, right: Int) {
            guard (right - left) > 1 else {
                return
            }
            let pivot = (left + right) / 2
            insert(nums[pivot])
            visit(nums: nums, left: left, right: pivot)
            visit(nums: nums, left: pivot, right: right)
        }
    }

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
}
