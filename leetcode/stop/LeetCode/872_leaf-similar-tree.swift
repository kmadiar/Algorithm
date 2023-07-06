//
//  872_leaf-similar-tree.swift
//  stop
//
//  Created by Kostiantyn Madiar on 08.12.2022.
//

import Foundation

enum __872 {
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

        var isLeaf: Bool {
            left == nil && right == nil
        }
    }

    class Solution {
        func leafSimilar(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
            collectLeaf(root1) == collectLeaf(root2)
        }

        func collectLeaf(_ node: TreeNode?) -> [Int] {
            guard let node = node else { return [] }

            let value: [Int] = node.isLeaf ? [node.val] : []
            return collectLeaf(node.left) + value + collectLeaf(node.right)
        }
    }

//    func makeTreeNode(_ input: [Int?]) -> TreeNode? {
//        var input = input
//        guard !input.isEmpty, let first = input.removeFirst() else { return nil }
//        let head = TreeNode(first)
//
//        var parent
//    }
}

