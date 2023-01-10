//
//  21_merge_two_sorted_linked_list.swift
//  stop
//
//  Created by Kostiantyn Madiar on 03.08.2022.
//

import Foundation

extension __21.ListNode: Comparable {
    static func < (lhs: __21.ListNode, rhs: __21.ListNode) -> Bool {
        lhs.val < rhs.val
    }

    static func == (lhs: __21.ListNode, rhs: __21.ListNode) -> Bool {
        lhs.val == rhs.val
    }
}

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
            var outputTail, outputHead: ListNode?
            var list1 = list1
            var list2 = list2
            while list1 != nil || list2 != nil {
                let minimum = [list1, list2].compactMap { $0 }.min()
                if list1 === minimum {
                    list1 = list1?.next
                } else {
                    list2 = list2?.next
                }
                if outputHead == nil {
                    outputHead = minimum
                    outputTail = minimum
                } else {
                    outputTail?.next = minimum
                    outputTail = outputTail?.next
                }
            }

            return outputHead
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
