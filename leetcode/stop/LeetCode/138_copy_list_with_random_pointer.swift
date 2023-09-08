//
//  138_copy_list_with_random_pointer.swift
//  stop
//
//  Created by Kostiantyn Madiar on 20.07.2023.
//

import Foundation

enum __138 {
      public class Node {
          public var val: Int
          public var next: Node?
          public var random: Node?
          public init(_ val: Int) {
              self.val = val
              self.next = nil
                self.random = nil
          }
      }

    class Solution {
        func copyRandomList(_ head: Node?) -> Node? {
            guard let head = head else { return nil }
            var map: [Int: Node] = [:]
            var first: Node? = head
            while let next = first {
                map[getHashValue(next)] = .init(next.val)
                first = first?.next
            }

            first = head
            while let start = first {
                let copy = map[getHashValue(start)]
                if let startNext = start.next {
                    copy?.next = map[getHashValue(startNext)]
                }
                if let startRandom = start.random {
                    copy?.random = map[getHashValue(startRandom)]
                }
                first = start.next
            }

            return map[getHashValue(head)]
        }

        func getHashValue(_ node: Node) -> Int {
            Unmanaged.passUnretained(node).toOpaque().hashValue
        }
    }
}
