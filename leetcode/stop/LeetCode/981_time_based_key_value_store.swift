//
//  981_time_based_key_value_store.swift
//  stop
//
//  Created by Kostiantyn Madiar on 19.07.2023.
//

import Foundation

/*
 981. Time Based Key-Value Store
 Medium
 Design a time-based key-value data structure that can store multiple values for the same key at different time stamps and retrieve the key's value at a certain timestamp.

 Implement the TimeMap class:

 TimeMap() Initializes the object of the data structure.
 void set(String key, String value, int timestamp) Stores the key key with the value value at the given time timestamp.
 String get(String key, int timestamp) Returns a value such that set was called previously, with timestamp_prev <= timestamp. If there are multiple such values, it returns the value associated with the largest timestamp_prev. If there are no values, it returns "".


 Example 1:

 Input
 ["TimeMap", "set", "get", "get", "set", "get", "get"]
 [[], ["foo", "bar", 1], ["foo", 1], ["foo", 3], ["foo", "bar2", 4], ["foo", 4], ["foo", 5]]
 Output
 [null, null, "bar", "bar", null, "bar2", "bar2"]

 Explanation
 TimeMap timeMap = new TimeMap();
 timeMap.set("foo", "bar", 1);  // store the key "foo" and value "bar" along with timestamp = 1.
 timeMap.get("foo", 1);         // return "bar"
 timeMap.get("foo", 3);         // return "bar", since there is no value corresponding to foo at timestamp 3 and timestamp 2, then the only value is at timestamp 1 is "bar".
 timeMap.set("foo", "bar2", 4); // store the key "foo" and value "bar2" along with timestamp = 4.
 timeMap.get("foo", 4);         // return "bar2"
 timeMap.get("foo", 5);         // return "bar2"


 Constraints:

 1 <= key.length, value.length <= 100
 key and value consist of lowercase English letters and digits.
 1 <= timestamp <= 107
 All the timestamps timestamp of set are strictly increasing.
 At most 2 * 105 calls will be made to set and get.
 */

enum __981 {
    class TimeMap {
        struct Node {
            init(value: String, timestamp: Int) {
                self.value = value
                self.timestamp = timestamp
            }

            let value: String
            let timestamp: Int
        }

        var hashMap: [String: [Node]] = [:]

        init() {

        }

        func set(_ key: String, _ value: String, _ timestamp: Int) {
            let node: Node = .init(value: value, timestamp: timestamp)
            if hashMap[key] != nil {
                hashMap[key]?.append(node)
            } else {
                hashMap[key] = [node]
            }
        }

        func get(_ key: String, _ timestamp: Int) -> String {
            if let value = find(key, timestamp) {
                return value
            }
            return ""
        }

        func find(_ key: String, _ timestamp: Int) -> String? {
            guard let mapValues = hashMap[key] else { return nil }

            var left = 0
            var right = mapValues.count - 1
            var outputIndex: Int?

            while right >= left {
                let pivot = (right + left) / 2

                let node = mapValues[pivot]

                if node.timestamp == timestamp {
                    return node.value
                }

                if node.timestamp < timestamp {
                    left = pivot + 1
                    if let unwrapped = outputIndex {
                        outputIndex = max(unwrapped, pivot)
                    } else {
                        outputIndex = pivot
                    }
                } else {
                    right = pivot - 1
                }
            }

            guard let foundedIndex = outputIndex else { return nil }
            return mapValues[foundedIndex].value
        }
    }
}
