//
//  146_lru_cache.swift
//  stop
//
//  Created by Kostiantyn Madiar on 21.07.2023.
//

import Foundation

enum __146 {
    class Node {
        init(key: Int,
             val: Int = 0,
             next: Node? = nil,
             prev: Node? = nil) {
            self.val = val
            self.next = next
            self.prev = prev
            self.key = key
        }

        var val: Int
        let key: Int
        var next: Node?
        var prev: Node?
    }

    class LRUCache {

        let capacity: Int
        let leastUsed = Node(key: 0)
        let mostUsed = Node(key: 0)
        var cache: [Int: Node] = [:]

        init(_ capacity: Int) {
            self.capacity = capacity
            leastUsed.next = mostUsed
            mostUsed.prev = leastUsed
        }

        func get(_ key: Int) -> Int {
            guard let node = cache[key] else { return -1 }
            remove(node)
            putRecent(.init(key: node.key, val: node.val))

            return node.val
        }

        func put(_ key: Int, _ value: Int) {
            if let node = cache[key] {
                remove(node)
            }
            putRecent(.init(key: key, val: value))

            if cache.count > capacity {
                remove(leastUsed.next!)
            }
        }

        func putRecent(_ node: Node) {
            cache[node.key] = node

            node.prev = mostUsed.prev
            node.next = mostUsed

            mostUsed.prev?.next = node
            mostUsed.prev = node
        }

        func remove(_ node: Node) {
            node.prev?.next = node.next
            node.next?.prev = node.prev
            cache.removeValue(forKey: node.key)
        }
    }
}

/*

 /*
 ["LRUCache", "put", "put", "get", "put", "get", "put", "get", "get", "get"]
 [[2], [1, 1], [2, 2], [1], [3, 3], [2], [4, 4], [1], [3], [4]]
 Output
 [null, null, null, 1, null, -1, null, -1, 3, 4]
 */

 let solution = __146.LRUCache(2)
 solution.put(1, 1)
 solution.put(2, 2)
 print(solution.get(1))
 solution.put(3, 3)
 print(solution.get(2))
 solution.put(4, 4)
 print(solution.get(1))
 print(solution.get(3))
 print(solution.get(4))
 */
