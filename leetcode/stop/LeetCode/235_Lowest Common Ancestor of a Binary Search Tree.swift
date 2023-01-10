//
//  235_235. Lowest Common Ancestor of a Binary Search Tree.swift
//  stop
//
//  Created by Kostiantyn Madiar on 12.08.2022.
//

import Foundation

enum __235 {
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }

    class Solution {
        func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
            guard let root = root, let p = p, let q = q else {
                return root
            }

            if p.val < root.val && q.val < root.val {
                return lowestCommonAncestor(root.left, p, q)
            }

            if p.val > root.val && q.val > root.val {
                return lowestCommonAncestor(root.right, p, q)
            }

            return root
        }
    }
}
