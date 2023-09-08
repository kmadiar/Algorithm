//
//  23_merge_k_sorted_linked_list.swift
//  stop
//
//  Created by Kostiantyn Madiar on 20.07.2023.
//

import Foundation

/*
 23. Merge k Sorted Lists
 Hard
 You are given an array of k linked-lists lists, each linked-list is sorted in ascending order.

 Merge all the linked-lists into one sorted linked-list and return it.

 Example 1:

 Input: lists = [[1,4,5],[1,3,4],[2,6]]
 Output: [1,1,2,3,4,4,5,6]
 Explanation: The linked-lists are:
 [
 1->4->5,
 1->3->4,
 2->6
 ]
 merging them into one sorted list:
 1->1->2->3->4->4->5->6
 Example 2:

 Input: lists = []
 Output: []
 Example 3:

 Input: lists = [[]]
 Output: []


 Constraints:

 k == lists.length
 0 <= k <= 104
 0 <= lists[i].length <= 500
 -104 <= lists[i][j] <= 104
 lists[i] is sorted in ascending order.
 The sum of lists[i].length will not exceed 104.
 */

enum __23 {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    class Solution {
        func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
            guard !lists.isEmpty else { return nil }
            var queue: [ListNode?] = lists

            while queue.count > 1 {
                let left = queue.removeFirst()
                let right = queue.removeFirst()
                if left != nil ||  right != nil {
                    queue.append(mergeNodes(leftNode: left, rightNode: right))
                }
            }

            return queue.first ?? nil
        }

        func mergeNodes(leftNode: ListNode?, rightNode: ListNode?) -> ListNode {
            let dummyNode = ListNode()

            var start: ListNode? = dummyNode
            var l1 = leftNode
            var l2 = rightNode

            while l1 != nil && l2 != nil {
                if l1!.val < l2!.val {
                    start?.next = l1
                    l1 = l1?.next
                } else {
                    start?.next = l2
                    l2 = l2?.next
                }
                start = start?.next
            }

            if l1 != nil {
                start?.next = l1
            }

            if l2 != nil {
                start?.next = l2
            }

            return dummyNode.next!
        }
    }
}
