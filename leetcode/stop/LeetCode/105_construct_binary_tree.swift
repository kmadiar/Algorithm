//
//  105_construct_binary_tree.swift
//  stop
//
//  Created by Kostiantyn Madiar on 22.07.2023.
//

import Foundation

/*
 105. Construct Binary Tree from Preorder and Inorder Traversal
 Medium
 Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.

 Example 1:


 Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
 Output: [3,9,20,null,null,15,7]
 Example 2:

 Input: preorder = [-1], inorder = [-1]
 Output: [-1]


 Constraints:

 1 <= preorder.length <= 3000
 inorder.length == preorder.length
 -3000 <= preorder[i], inorder[i] <= 3000
 preorder and inorder consist of unique values.
 Each value of inorder also appears in preorder.
 preorder is guaranteed to be the preorder traversal of the tree.
 inorder is guaranteed to be the inorder traversal of the tree.
 */


enum __105 {
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
        func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
            guard !preorder.isEmpty && !inorder.isEmpty else { return nil }
            let root = TreeNode(preorder[0])
            let position = inorder.firstIndex(where: { $0 == root.val })!
            root.left = buildTree(Array(preorder[1..<position+1]), Array(inorder[0..<position]))
            root.right = buildTree(Array(preorder[position+1..<preorder.count]), Array(inorder[position+1..<inorder.count]))

            return root
        }
    }
}
