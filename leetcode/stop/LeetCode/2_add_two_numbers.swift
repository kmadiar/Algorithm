//
//  2_add_two_numbers.swift
//  stop
//
//  Created by Kostiantyn Madiar on 20.07.2023.
//

import Foundation

/*
 2. Add Two Numbers
 Medium
 You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order, and each of their nodes contains a single digit. Add the two numbers and return the sum as a linked list.

 You may assume the two numbers do not contain any leading zero, except the number 0 itself.



 Example 1:


 Input: l1 = [2,4,3], l2 = [5,6,4]
 Output: [7,0,8]
 Explanation: 342 + 465 = 807.
 Example 2:

 Input: l1 = [0], l2 = [0]
 Output: [0]
 Example 3:

 Input: l1 = [9,9,9,9,9,9,9], l2 = [9,9,9,9]
 Output: [8,9,9,9,0,0,0,1]


 Constraints:

 The number of nodes in each linked list is in the range [1, 100].
 0 <= Node.val <= 9
 It is guaranteed that the list represents a number that does not have leading zeros.
 */

enum __2 {
    class Solution {
        public class ListNode {
            public var val: Int
            public var next: ListNode?
            public init() { self.val = 0; self.next = nil; }
            public init(_ val: Int) { self.val = val; self.next = nil; }
            public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
        }
        func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            var reminder = 0
            let dummy = ListNode()

            var l1 = l1
            var l2 = l2
            var start = dummy
            while l1 != nil || l2 != nil {
                let sum = (l1?.val ?? 0) + (l2?.val ?? 0) + reminder
                let value: Int
                if sum > 9 {
                    reminder = 1
                    value = sum - 10
                } else {
                    reminder = 0
                    value = sum
                }
                let node = ListNode(value)
                start.next = node
                start = node
                l1 = l1?.next
                l2 = l2?.next
            }
            if reminder > 0 {
                start.next = ListNode(reminder)
            }

            return dummy.next
        }
    }
}
