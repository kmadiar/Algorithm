//
//  144_binary_tree_preorder_traversal.swift
//  stop
//
//  Created by Kostiantyn Madiar on 09.01.2023.
//

import Foundation

enum __144 {
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

        func preorderTraversal(_ root: TreeNode?) -> [Int] {
            guard let root = root else { return [] }
            return [root.val] + preorderTraversal(root.left) + preorderTraversal(root.right)
        }
    }
}

/*
 typealias tn = __144.Solution.TreeNode

 [
     (tn(1, nil, tn(2, tn(3), nil)), [1,2,3])
 ]
     .forEach { input, expected in
         let output = __144.Solution().preorderTraversal(input)
         print(output)
         print(output == expected)
     }
 */
