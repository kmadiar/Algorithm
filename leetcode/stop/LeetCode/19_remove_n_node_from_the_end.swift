//
//  19_remove_n_node_from_the_end.swift
//  stop
//
//  Created by Kostiantyn Madiar on 20.07.2023.
//

import Foundation

/*
 19. Remove Nth Node From End of List
 Medium
 Given the head of a linked list, remove the nth node from the end of the list and return its head.



 Example 1:


 Input: head = [1,2,3,4,5], n = 2
 Output: [1,2,3,5]
 Example 2:

 Input: head = [1], n = 1
 Output: []
 Example 3:

 Input: head = [1,2], n = 1
 Output: [1]


 Constraints:

 The number of nodes in the list is sz.
 1 <= sz <= 30
 0 <= Node.val <= 100
 1 <= n <= sz


 Follow up: Could you do this in one pass?
 */

enum __19 {
      public class ListNode {
          public var val: Int
          public var next: ListNode?
          public init() { self.val = 0; self.next = nil; }
          public init(_ val: Int) { self.val = val; self.next = nil; }
          public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
      }

    class Solution {
        func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
            let dummy = ListNode(0, head)

            var fast: ListNode? = head
            var slow: ListNode? = dummy

            var index = n
            while index > 0 {
                fast = fast?.next
                index -= 1
            }

            while fast != nil {
                slow = slow?.next
                fast = fast?.next
            }

            slow?.next = slow?.next?.next

            return dummy.next
        }
    }
}

/*
 let head = __19.ListNode(1)

 let solution = __19.Solution()
 print(solution.removeNthFromEnd(head, 1))
 */
