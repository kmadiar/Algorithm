//
//  206_reversed_linked_list.swift
//  stop
//
//  Created by Kostiantyn Madiar on 28.06.2023.
//

import Foundation

/// Given the head of a singly linked list, reverse the list, and return the reversed list.
enum __206 {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }
    class Solution {
        func reverseList(_ head: ListNode?) -> ListNode? {
            var output: ListNode? = nil
            var current: ListNode? = head

            while current != nil {
                let next = current?.next
                current?.next = output
                output = current
                current = next
            }

            return output
        }
    }
}
