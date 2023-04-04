//
//  876_middle_of_linked_list.swift
//  stop
//
//  Created by Kostiantyn Madiar on 04.04.2023.
//

import Foundation

/*
 876. Middle of the Linked List
 Given the head of a singly linked list, return the middle node of the linked list.

 If there are two middle nodes, return the second middle node.
 */

enum __876 {
     class ListNode {
         var val: Int
         var next: ListNode?
         init() { self.val = 0; self.next = nil; }
         init(_ val: Int) { self.val = val; self.next = nil; }
         init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }

    class Solution {
        func middleNode(_ head: ListNode?) -> ListNode? {
            var first = head
            var second = head?.next
            while second != nil {
                first = first?.next
                second = second?.next?.next
            }

            return first
        }
    }
}
