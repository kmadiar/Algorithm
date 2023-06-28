//
//  234_palindrome_linked_list.swift
//  stop
//
//  Created by Kostiantyn Madiar on 28.06.2023.
//

import Foundation
fileprivate typealias ListNode = __234.ListNode

enum __234 {

    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }

    class Solution {
        func isPalindrome(_ head: ListNode?) -> Bool {
            let reversed = reverseList(head)

            return head == reversed
        }

        func reverseList(_ node: ListNode?) -> ListNode? {
            var head: ListNode?
            var current = node
            while let currentNode = current {
                let nextNode = ListNode(currentNode.val)
                nextNode.next = head
                head = nextNode

                current = currentNode.next
            }

            return head
        }
    }
}

extension ListNode: Equatable {
    static func ==(lhs: __234.ListNode, rhs: __234.ListNode) -> Bool {
        var leftNode: ListNode? = lhs
        var rightNode: ListNode? = rhs
        while leftNode != nil, rightNode != nil {
            guard leftNode?.val == rightNode?.val else {
                return false
            }

            leftNode = leftNode?.next
            rightNode = rightNode?.next
        }

        return true
    }
}

//typealias Node = __234.ListNode
//
//let inputs = [
//     (Node(1, Node(2, Node(2, Node(1)))), true),
//     (Node(1, Node(2, Node(1, Node(2, Node(1))))), true),
//     (Node(1, Node(1, Node(1, Node(2, Node(1))))), false),
//     (Node(1), true),
//     (Node(1, Node(2)), false),
// ]
//
// inputs.forEach { (input, result) in
//     let solution = __234.Solution()
//     let output = solution.isPalindrome(input)
//
//     print(output == result)
// }
