//
//  _328.swift
//  stop
//
//  Created by Kostiantyn Madiar on 06.12.2022.
//

import Foundation

enum __328 {
      public class ListNode {
          public var val: Int
          public var next: ListNode?
          public init() { self.val = 0; self.next = nil; }
          public init(_ val: Int) { self.val = val; self.next = nil; }
          public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }

          func append(_ node: ListNode?) {
              if let next {
                  next.next = node
              } else {
                  next = node
              }
          }
      }

    class Solution {
        func oddEvenList(_ head: ListNode?) -> ListNode? {
            guard let head else { return nil }
            var odd: Bool = true
            let oddList: ListNode? = .init(head.val)
            var evenList: ListNode?
            var current = head
            var currentOdd: ListNode? = oddList
            var currentEven: ListNode?

            while let next = current.next {
                odd.toggle()
                if odd {
                    let node: ListNode = .init(next.val)
                    currentOdd?.next = node
                    currentOdd = node
                } else {
                    let node = ListNode(next.val)
                    if evenList == nil {
                        evenList = node
                        currentEven = node
                    } else {
                        currentEven?.next = node
                        currentEven = node
                    }
                }
                current = next
            }

            currentOdd?.append(evenList)
            return oddList
        }

        func makeList(_ input: [Int]) -> ListNode? {
            var input = input
            guard !input.isEmpty else { return nil }

            let first = input.removeFirst()
            let head = ListNode(first)
            var tempNode: ListNode? = head
            input.forEach { nextValue in
                let nextNode = ListNode(nextValue)
                tempNode?.next = nextNode
                tempNode = nextNode
            }

            return head
        }

        func druk(_ firstNode: ListNode?) {
            var head = firstNode
            print(head?.val)
            while let next = head?.next {
                head = next
                print(head?.val)
            }
        }
    }
}

//let solution328 = __328.Solution()
//
//let inputs = [
//    [1, 2, 3, 4, 5],
//    [],
//    [1, 2, 3],
//    [1, 2, 3, 4]
//].map(process)
//
//func process(input: [Int]) {
//    print("")
//    print("=======")
//    let firstNode = solution328.makeList(input)
//
//    solution328.druk(firstNode)
//
//    let second = solution328.oddEvenList(firstNode)
//    print("-------")
//    solution328.druk(second)
//    print("=======")
//    print("")
//}
