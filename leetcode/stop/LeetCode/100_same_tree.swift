//
//  100_same_tree.swift
//  stop
//
//  Created by Kostiantyn Madiar on 10.01.2023.
//

import Foundation

/*
 100. Same Tree
 Easy
 Given the roots of two binary trees p and q, write a function to check if they are the same or not.

 Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.
 */

enum __100 {
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
        func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
            if p == nil && q == nil {
                return true
            }
            return p?.val == q?.val && isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        }
    }
}

/*
 typealias tn = __100.TreeNode

 [
     (tn(1, tn(2), tn(3)), tn(1, tn(2), tn(3)), true),
     (tn(1, tn(2), nil), tn(1, nil, tn(2)), false),
     (tn(1, tn(2), tn(1)), tn(1, tn(1), tn(2)), false)
 ]
     .forEach { left, right, expected in
         let output = __100.Solution().isSameTree(left, right)
         print(output == expected)
     }
 */
