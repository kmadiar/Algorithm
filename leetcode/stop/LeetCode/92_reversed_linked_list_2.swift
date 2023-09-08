//
//  92_reversed_linked_list_2.swift
//  stop
//
//  Created by Kostiantyn Madiar on 07/09/2023.
//

import Foundation

/*
 92. Reverse Linked List II
 Medium
 Given the head of a singly linked list and two integers left and right where left <= right, reverse the nodes of the list from position left to position right, and return the reversed list.



 Example 1:


 Input: head = [1,2,3,4,5], left = 2, right = 4
 Output: [1,4,3,2,5]
 Example 2:

 Input: head = [5], left = 1, right = 1
 Output: [5]


 Constraints:

 The number of nodes in the list is n.
 1 <= n <= 500
 -500 <= Node.val <= 500
 1 <= left <= right <= n


 Follow up: Could you do it in one pass?
 */

enum __92 {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }

        func flatMap() -> [Int] {
            var current: ListNode? = self
            var output: [Int] = []

            while let nextValue = current?.val {
                output.append(nextValue)
                current = current?.next
            }

            return output
        }

        static func create(from input: [Int]) -> ListNode? {
            guard !input.isEmpty else { return nil }

            let fakeHead: ListNode = .init()
            var current: ListNode? = fakeHead
            input.forEach { nextValue in
                current?.next = .init(nextValue)
                current = current?.next
            }

            return fakeHead.next
        }
    }

    class Solution {
        func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
            var head = head
            var leftNodePrevious = findNode(with: left - 1, in: head)
            let leftNode = findNode(with: left, in: head)
            let rightNode = findNode(with: right, in: head)

            let rightNodeNext = rightNode?.next
            rightNode?.next = nil

            let reversedNodes = reverse(node: leftNode)

            if leftNodePrevious == nil { // leftNode was first node
                leftNodePrevious = reversedNodes
                head = leftNodePrevious
            } else {
                leftNodePrevious?.next = reversedNodes
            }
            leftNode?.next = rightNodeNext

            return head
        }

        func findNode(with offset: Int, in list: ListNode?) -> ListNode? {
            var current = list
            var position = 1
            while current != nil {
                if position == offset {
                    return current
                }
                current = current?.next
                position += 1
            }
            return nil
        }

        func reverse(node: ListNode?) -> ListNode? {
            var currentNode = node
            var previousNode: ListNode? = nil

            while currentNode != nil {
                let nextNode = currentNode?.next
                currentNode?.next = previousNode
                previousNode = currentNode
                currentNode = nextNode
            }

            return previousNode
        }
    }
}

let inputs = [
    ([1, 2, 3, 4, 5], 2, 4),
    ([5], 1, 1),
    ([3, 5], 1, 1),
    ([5, 3], 1, 2)
]

let expectations = [
    [1, 4, 3, 2, 5],
    [5],
    [3, 5],
    [3, 5]
]

let solution = __92.Solution()

zip(inputs, expectations)
    .forEach { input, expected in
        let node = __92.ListNode.create(from: input.0)
        let result = solution.reverseBetween(node, input.1, input.2)

        if result?.flatMap() != expected {
            print(result?.flatMap(), expected)
        } else {
            print("passed")
        }
    }
