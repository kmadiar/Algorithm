//
//  230_kth_smaller_element_in_bst.swift
//  stop
//
//  Created by Kostiantyn Madiar on 22.07.2023.
//

import Foundation

/*
 230. Kth Smallest Element in a BST
 Medium
 Given the root of a binary search tree, and an integer k, return the kth smallest value (1-indexed) of all the values of the nodes in the tree.



 Example 1:


 Input: root = [3,1,4,null,2], k = 1
 Output: 1
 Example 2:


 Input: root = [5,3,6,2,4,null,null,1], k = 3
 Output: 3


 Constraints:

 The number of nodes in the tree is n.
 1 <= k <= n <= 104
 0 <= Node.val <= 104


 Follow up: If the BST is modified often (i.e., we can do insert and delete operations) and you need to find the kth smallest frequently, how would you optimize?
 */

enum __230 {
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
        func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
            var n = 0
            var stack: [TreeNode] = []

            var current = root
            while current != nil || !stack.isEmpty {
                while current != nil {
                    stack.append(current!)
                    current = current!.left
                }

                current = stack.removeLast()
                n += 1
                if n == k {
                    return current!.val
                }

                current = current!.right
            }
            return 0
        }
    }
}
