//
//  143_reorder_list.swift
//  stop
//
//  Created by Kostiantyn Madiar on 20.07.2023.
//

import Foundation

/*

 143. Reorder List
 Medium
 9.2K
 304
 Companies
 You are given the head of a singly linked-list. The list can be represented as:

 L0 → L1 → … → Ln - 1 → Ln
 Reorder the list to be on the following form:

 L0 → Ln → L1 → Ln - 1 → L2 → Ln - 2 → …
 You may not modify the values in the list's nodes. Only nodes themselves may be changed.



 Example 1:


 Input: head = [1,2,3,4]
 Output: [1,4,2,3]
 Example 2:


 Input: head = [1,2,3,4,5]
 Output: [1,5,2,4,3]


 Constraints:

 The number of nodes in the list is in the range [1, 5 * 104].
 1 <= Node.val <= 1000
 */

enum __143 {

    class ListNode {
        public var val: Int
        public var next: ListNode?
        public init() { self.val = 0; self.next = nil; }
        public init(_ val: Int) { self.val = val; self.next = nil; }
        public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }

        func flatten() -> [Int] {
            var output: [Int] = [val]
            var start = next
            while let next = start {
                output.append(next.val)
                start = next.next
            }

            return output
        }

        static func toList(values: [Int]) -> ListNode {
            let head: ListNode = .init()
            var start = head

            for value in values {
                let node = ListNode(value)
                start.next = node
                start = node
            }

            return head.next!
        }
    }

    class Solution {
        func reorderList(_ head: ListNode?) {
            // divide into two parts
            var fast = head
            var slow = head

            while fast != nil {
                slow = slow?.next
                fast = fast?.next?.next
            }
            // traverse second part
            var current: ListNode? = slow
            var previous: ListNode?

            while current != nil {

                let next = current?.next
                current?.next = previous
                previous = current

                current = next
            }

            //3 merge
            var mergedHead = previous

            var second = false
            var list1 = head?.next
            var list2 = previous?.next

            while list1 != nil && list2 != nil {
                if second {
                    mergedHead?.next = list2
                    list2 = list2?.next
                    second = false
                } else {
                    mergedHead?.next = list1
                    list1 = list1?.next
                    second = true
                }
                mergedHead = mergedHead?.next
            }

            if list1 !== mergedHead {
                mergedHead?.next = list1
                mergedHead?.next?.next = nil
            }

            head?.next = previous
        }
    }
}

/*
 let inputs = [
     ([1, 2, 3, 4], [1, 4, 2, 3]),
     ([1,2,3,4,5], [1,5,2,4,3])
  ]

  inputs
     .map {
         (__143.ListNode.toList(values: $0.0), __143.ListNode.toList(values: $0.1))
     }
     .forEach { (input, result) in
      let solution = __143.Solution()
      solution.reorderList(input)

     print(input.flatten() == result.flatten())
         print(input.flatten(), result.flatten())
  }
 */
