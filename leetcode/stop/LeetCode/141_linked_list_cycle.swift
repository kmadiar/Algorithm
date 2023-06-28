//
//  141_linked_list_cycle.swift
//  stop
//
//  Created by Kostiantyn Madiar on 28.06.2023.
//

import Foundation

enum __141 {
    class Solution {
        func hasCycle(_ head: ListNode?) -> Bool {
            var slow = head
            var fast = head
            while fast != nil && fast?.next != nil {
                slow = slow?.next
                fast = fast?.next?.next
                if fast === slow {
                    return true
                }
            }

            return false
        }
    }
}
