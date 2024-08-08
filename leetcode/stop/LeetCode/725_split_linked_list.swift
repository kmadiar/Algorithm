//
//  725_split_linked_list.swift
//  stop
//
//  Created by Kostiantyn Madiar on 06/09/2023.
//

import Foundation
/*
 725. Split Linked List in Parts
 Medium
 Given the head of a singly linked list and an integer k, split the linked list into k consecutive linked list parts.

 The length of each part should be as equal as possible: no two parts should have a size differing by more than one. This may lead to some parts being null.

 The parts should be in the order of occurrence in the input list, and parts occurring earlier should always have a size greater than or equal to parts occurring later.

 Return an array of the k parts.



 Example 1:


 Input: head = [1,2,3], k = 5
 Output: [[1],[2],[3],[],[]]
 Explanation:
 The first element output[0] has output[0].val = 1, output[0].next = null.
 The last element output[4] is null, but its string representation as a ListNode is [].
 Example 2:


 Input: head = [1,2,3,4,5,6,7,8,9,10], k = 3
 Output: [[1,2,3,4],[5,6,7],[8,9,10]]
 Explanation:
 The input has been split into consecutive parts with size difference at most 1, and earlier parts are a larger size than the later parts.


 Constraints:

 The number of nodes in the list is in the range [0, 1000].
 0 <= Node.val <= 1000
 1 <= k <= 50
 */
enum __725 {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    class Solution {
        func splitListToParts(_ head: ListNode?, _ k: Int) -> [ListNode?] {
            var k = k
            let fakeHead = ListNode(0, head)
            var currentNode: ListNode? = fakeHead
            var nodesCounter = 0

            while let next = currentNode?.next {
                nodesCounter += 1
                currentNode = next
            }

            var reminder = nodesCounter < k ? 0 : nodesCounter % k
            let base = nodesCounter / k
            var output: [ListNode?] = []

            var nextNode = fakeHead.next
            while k > 0 {
                output.append(nextNode)
                var currentBase = 0
                while currentBase < base - 1 {
                    nextNode = nextNode?.next
                    currentBase += 1
                }

                if reminder > 0 {
                    nextNode = nextNode?.next
                    reminder -= 1
                }

                let next = nextNode?.next
                nextNode?.next = nil
                nextNode = next

                k -= 1
            }

            return output
        }
    }
}
