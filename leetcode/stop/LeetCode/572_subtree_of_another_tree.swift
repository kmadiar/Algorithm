//
//  572_subtree_of_another_tree.swift
//  stop
//
//  Created by Kostiantyn Madiar on 21.07.2023.
//

import Foundation

/*
 572. Subtree of Another Tree
 Easy
 Given the roots of two binary trees root and subRoot, return true if there is a subtree of root with the same structure and node values of subRoot and false otherwise.

 A subtree of a binary tree tree is a tree that consists of a node in tree and all of this node's descendants. The tree tree could also be considered as a subtree of itself.



 Example 1:


 Input: root = [3,4,5,1,2], subRoot = [4,1,2]
 Output: true
 Example 2:


 Input: root = [3,4,5,1,2,null,null,null,null,0], subRoot = [4,1,2]
 Output: false


 Constraints:

 The number of nodes in the root tree is in the range [1, 2000].
 The number of nodes in the subRoot tree is in the range [1, 1000].
 -104 <= root.val <= 104
 -104 <= subRoot.val <= 104
 */

enum __572 {
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
        func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
            if root == nil && subRoot == nil { return true }
            guard root != nil && subRoot != nil else { return false }
            return isTheSameTree(root, subRoot) || isSubtree(root?.left, subRoot) || isSubtree(root?.right, subRoot)
        }

        func isTheSameTree(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
            if right == nil && left == nil { return true }
            guard left != nil && right != nil else { return false }

            return left?.val == right?.val && isTheSameTree(left?.left, right?.left) && isTheSameTree(left?.right, right?.right)
        }
    }
}
