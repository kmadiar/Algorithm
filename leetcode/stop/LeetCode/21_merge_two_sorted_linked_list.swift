//
//  21_merge_two_sorted_linked_list.swift
//  stop
//
//  Created by Kostiantyn Madiar on 03.08.2022.
//

import Foundation

enum __21 {
    class ListNode {
         public var val: Int
         public var next: ListNode?
         public init() { self.val = 0; self.next = nil; }
         public init(_ val: Int) { self.val = val; self.next = nil; }
         public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
    }

    class Solution {
        func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
            let fakeHead = ListNode()
            var outputTail: ListNode? = fakeHead
            var list1 = list1
            var list2 = list2

            while list1 != nil && list2 != nil {
                if list1!.val < list2!.val {
                    outputTail?.next = list1
                    list1 = list1?.next
                } else {
                    outputTail?.next = list2
                    list2 = list2?.next
                }
                outputTail = outputTail?.next
            }

            if list1 != nil {
                outputTail?.next = list1
            }
            if list2 != nil {
                outputTail?.next = list2
            }

            return fakeHead.next
        }
    }
}

/*

let list1: ListNode = .init(1, .init(2, .init(4)))
let list2: ListNode = .init(1, .init(3, .init(4)))

let solution = Solution()

var list = solution.mergeTwoLists(list1, list2)

while let node = list {
    print(node.val)
    list = list?.next
}
 */
