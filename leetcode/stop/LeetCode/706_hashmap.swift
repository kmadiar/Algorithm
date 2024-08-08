//
//  706_hashmap.swift
//  stop
//
//  Created by Kostiantyn Madiar on 04/10/2023.
//

import Foundation

enum __706 {
    /*
     Design a HashMap without using any built-in hash table libraries.

     Implement the MyHashMap class:

     MyHashMap() initializes the object with an empty map.
     void put(int key, int value) inserts a (key, value) pair into the HashMap. If the key already exists in the map, update the corresponding value.
     int get(int key) returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key.
     void remove(key) removes the key and its corresponding value if the map contains the mapping for the key.


     Example 1:

     Input
     ["MyHashMap", "put", "put", "get", "get", "put", "get", "remove", "get"]
     [[], [1, 1], [2, 2], [1], [3], [2, 1], [2], [2], [2]]
     Output
     [null, null, null, 1, -1, null, 1, null, -1]

     Explanation
     MyHashMap myHashMap = new MyHashMap();
     myHashMap.put(1, 1); // The map is now [[1,1]]
     myHashMap.put(2, 2); // The map is now [[1,1], [2,2]]
     myHashMap.get(1);    // return 1, The map is now [[1,1], [2,2]]
     myHashMap.get(3);    // return -1 (i.e., not found), The map is now [[1,1], [2,2]]
     myHashMap.put(2, 1); // The map is now [[1,1], [2,1]] (i.e., update the existing value)
     myHashMap.get(2);    // return 1, The map is now [[1,1], [2,1]]
     myHashMap.remove(2); // remove the mapping for 2, The map is now [[1,1]]
     myHashMap.get(2);    // return -1 (i.e., not found), The map is now [[1,1]]


     Constraints:

     0 <= key, value <= 106
     At most 104 calls will be made to put, get, and remove.
     */

    class MyHashMap {
        private class Node {
            init(value: Int, key: Int, next: Node? = nil) {
                self.value = value
                self.key = key
                self.next = next
            }
            var key: Int
            var value: Int
            var next: Node?
        }
        private var storage: [Node?] = .init(repeating: nil, count: 106)

        init() {

        }

        func index(for key: Int) -> Int {
            key % storage.count
        }

        func put(_ key: Int, _ value: Int) {
            let index = index(for: key)
            if var node = storage[index] {
                if node.key == key {
                    node.value = value
                    return
                }
                while let nextNode = node.next {
                    if nextNode.key == key {
                        nextNode.value = value
                        return
                    }
                    node = nextNode
                }
                node.next = .init(value: value, key: key)

            } else {
                storage[index] = .init(value: value, key: key)
            }
        }

        func get(_ key: Int) -> Int {
            if let node = storage[index(for: key)] {
                var currentNode = node
                if currentNode.key == key {
                    return currentNode.value
                }
                while let nextNode = currentNode.next {
                    if nextNode.key == key {
                        return nextNode.value
                    }
                    currentNode = nextNode
                }
            }

            return -1
        }

        func remove(_ key: Int) {
            let index = index(for: key)
            if let node = storage[index] {
                let headNode = node
                if headNode.key == key {
                    storage[index] = headNode.next
                }

                while let nextNode = headNode.next {
                    if nextNode.key == key {
                        headNode.next = nextNode.next
                        return
                    }
                }
            }
        }
    }
}
