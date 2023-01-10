//
//  98_valid_tree.swift
//  stop
//
//  Created by Kostiantyn Madiar on 11.08.2022.
//

import Foundation

enum __98 {
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
            func isValidBST(_ root: TreeNode?) -> Bool {
                guard let root = root else {
                    return true
                }
                return isValidBST(root, min: Int.min, max: Int.max)
            }

            func isValidBST(_ root: TreeNode?,
                            min: Int, max: Int) -> Bool {
                guard let root = root else {
                    return true
                }

                if root.val < max && root.val > min {
                    return isValidBST(root.left, min: min, max: root.val)
                    && isValidBST(root.right, min: root.val, max: max)
                }

                return false
            }
        }
}


//let solution98 = __98.Solution()
//
////[5,4,6,null,null,3,7]
//
////[5,1,4,null,null,3,6]
//let root: __98.TreeNode = .init(5, .init(4), .init(6, .init(3), .init(7)))
//
////             5
////            / \
////           /   \
////          /     \
////         /       \
////        /         \
////       /           \
////       4            6
////     /  \         /  \
////    null  null   3    7
//
//
////print(solution98.isValidBST(root))
//
//let root2: __98.TreeNode = .init(2, .init(1), .init(3))
////print(solution98.isValidBST(root2))
//
//let root3: __98.TreeNode = .init(2, .init(2), .init(2))
////print(solution98.isValidBST(root3))
//
////            32
////            / \
////           /   \
////          /     \
////         /       \
////        /         \
////       /           \
////      26           47
////     /  \         /  \
////    19  null   null  56
////   /  \
//// null  27
//
//let root5: __98.TreeNode = .init(
//    32,
//    __98.TreeNode(
//        26,
//        __98.TreeNode(
//            19,
//            nil,
//            __98.TreeNode(27)
//        ),
//        nil
//    ),
//    __98.TreeNode(
//        47,
//        nil,
//        __98.TreeNode(56))
//)
//
//print(solution98.isValidBST(root5))
//
////let roor4: __98.TreeNode = .init(1, nil, .init(1))
////print(solution98.isValidBST(roor4))

