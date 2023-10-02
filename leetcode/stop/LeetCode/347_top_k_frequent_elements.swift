//
//  347_top_k_frequent_elements.swift
//  stop
//
//  Created by Kostiantyn Madiar on 13.07.2023.
//

import Foundation



enum __347 {
    /*
     347. Top K Frequent Elements
     Medium
     Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.



     Example 1:

     Input: nums = [1,1,1,2,2,3], k = 2
     Output: [1,2]
     Example 2:

     Input: nums = [1], k = 1
     Output: [1]


     Constraints:

     1 <= nums.length <= 105
     -104 <= nums[i] <= 104
     k is in the range [1, the number of unique elements in the array].
     It is guaranteed that the answer is unique.


     Follow up: Your algorithm's time complexity must be better than O(n log n), where n is the array's size.     */
//    class Solution {
//        func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
//            var hashMap: Dictionary<Int, Int> = [:] // create a hash map
//            for number in nums {
//                let value = hashMap[number] ?? 0
//                hashMap[number] = value + 1 // count number of occurrences for each element
//            }
//            return hashMap
//                .sorted { $0.1 > $1.1 } // sort by number of occurrence
//                .prefix(k)              // take first k results
//                .map { $0.0 }           // take key which is the number from nums
//        }
//    }

    class Solution {
        func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
            let heap = Heap()
            var keyMap: [Int: Int] = [:]

            nums.forEach { number in
                keyMap[number] = (keyMap[number] ?? 0) + 1
            }
            keyMap
                .forEach { number, occurrence in
                    heap.insert(.init(key: occurrence, value: number))
                }
            var output: [Int] = []
            for _ in 0..<k {
                if let node = heap.removeFirst() {
                    output.append(node.value)
                }
            }

            return output
        }
    }

    class Node: Comparable {
        static func < (lhs: __347.Node, rhs: __347.Node) -> Bool {
            lhs.key < rhs.key
        }

        static func == (lhs: __347.Node, rhs: __347.Node) -> Bool {
            lhs.key == rhs.key
        }

        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }

        let key: Int
        let value: Int
    }

    class Heap {
        class Node {
            init(key: Int, value: Int) {
                self.key = key
                self.value = value
            }

            let key: Int
            let value: Int
        }

        private var storage: [Node] = []

        private var heapCondition: (Node, Node) -> Bool = { lhs, rhs in
            lhs.key > rhs.key
        }

        private func parentIndex(for index: Int) -> Int {
            (index) / 2
        }

        private func leftIndex(for parent: Int) -> Int {
            parent * 2
        }

        private func rightIndex(for parent: Int) -> Int {
            parent * 2 + 1
        }

        private func isInRange(index: Int) -> Bool {
            index >= 0 && index < storage.count
        }

        func peek() -> Node? {
            storage.first
        }

        func insert(_ node: Node) {
            storage.append(node)

            siftUp(storage.count - 1)
        }

        func removeFirst() -> Node? {
            guard !storage.isEmpty else { return nil }
            let output = storage.first

            let lastNode = storage.removeLast()
            if storage.isEmpty {
                return output
            }
            storage[0] = lastNode
            siftDown(0)

            return output
        }

        func siftDown(_ index: Int) {
            let leftIndex = leftIndex(for: index)
            let rightIndex = rightIndex(for: index)
            var indexToSwap = index

            if isInRange(index: leftIndex) && !heapCondition(storage[indexToSwap], storage[leftIndex]) {
                indexToSwap = leftIndex
            }
            if isInRange(index: rightIndex) && !heapCondition(storage[indexToSwap], storage[rightIndex]) {
                indexToSwap = rightIndex
            }

            if indexToSwap != index {
                storage.swapAt(index, indexToSwap)
                siftDown(indexToSwap)
            }

        }

        func siftUp(_ index: Int) {
            let parentIndex = parentIndex(for: index)

            if isInRange(index: parentIndex) && heapCondition(storage[index], storage[parentIndex]) {
                storage.swapAt(index, parentIndex)
                siftUp(parentIndex)
            }
        }
    }
}


/*
 let heap = __347.Heap()

 let values = [1, 2, 3, 4, 5]

 values.forEach { intValue in
     heap.insert(.init(key: intValue, value: 0))
 }

 values.reversed().forEach { value in
     print(heap.removeFirst()!.key == value)
 }

 */
