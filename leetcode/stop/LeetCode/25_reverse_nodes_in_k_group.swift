//
//  25_reverse_nodes_in_k_group.swift
//  stop
//
//  Created by Kostiantyn Madiar on 21.07.2023.
//

import Foundation

/*
 25. Reverse Nodes in k-Group
 Hard
 Given the head of a linked list, reverse the nodes of the list k at a time, and return the modified list.

 k is a positive integer and is less than or equal to the length of the linked list. If the number of nodes is not a multiple of k then left-out nodes, in the end, should remain as it is.

 You may not alter the values in the list's nodes, only nodes themselves may be changed.



 Example 1:


 Input: head = [1,2,3,4,5], k = 2
 Output: [2,1,4,3,5]
 Example 2:


 Input: head = [1,2,3,4,5], k = 3
 Output: [3,2,1,4,5]


 Constraints:

 The number of nodes in the list is n.
 1 <= k <= n <= 5000
 0 <= Node.val <= 1000


 Follow-up: Can you solve the problem in O(1) extra memory space?
 */

enum __25 {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }

    class Solution {
        func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
            let dummy = ListNode(0, head)

            var groupPrevious: ListNode? = dummy

            while true {
                guard let next = getNext(current: groupPrevious, k: k) else { break }
                var nextGroup = next.next

                var prev = next.next, current = groupPrevious?.next

                while current !== nextGroup {
                    let tmp = current?.next
                    current?.next = prev
                    prev = current
                    current = tmp
                }

                let tmp = groupPrevious?.next
                groupPrevious?.next = next
                groupPrevious = tmp
            }

            return dummy.next

        }

        func getNext(current: ListNode?, k: Int) -> ListNode? {
            var k = k
            var current = current
            while current != nil, k > 0 {
                current = current?.next
                k -= 1
            }

            return current
        }
    }
}
