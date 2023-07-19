//
//  239_max_sliding_window.swift
//  stop
//
//  Created by Kostiantyn Madiar on 18.07.2023.
//

import Foundation

/*

 239. Sliding Window Maximum
 Hard
 You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.

 Return the max sliding window.

 Example 1:

 Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
 Output: [3,3,5,5,6,7]
 Explanation:
 Window position                Max
 ---------------               -----
 [1  3  -1] -3  5  3  6  7       3
  1 [3  -1  -3] 5  3  6  7       3
  1  3 [-1  -3  5] 3  6  7       5
  1  3  -1 [-3  5  3] 6  7       5
  1  3  -1  -3 [5  3  6] 7       6
  1  3  -1  -3  5 [3  6  7]      7
 Example 2:

 Input: nums = [1], k = 1
 Output: [1]


 Constraints:

 1 <= nums.length <= 105
 -104 <= nums[i] <= 104
 1 <= k <= nums.length

 */

enum __239 {
    class Deque {
        class DequeNode {
            internal init(value: Int,
                          next: Deque.DequeNode? = nil,
                          previous: Deque.DequeNode? = nil) {
                self.value = value
                self.next = next
                self.previous = previous
            }

            let value: Int
            var next: DequeNode?
            var previous: DequeNode?
        }

        var head: DequeNode?
        var tail: DequeNode?

        func pushFront(value: Int) {
            let node = DequeNode(value: value, next: head)
            head?.previous = node
            head = node
            if tail == nil {
                tail = head
            }
        }

        func pushBack(value: Int) {
            let node = DequeNode(value: value, previous: tail)
            tail?.next = node
            tail = node
            if head == nil {
                head = tail
            }
        }

        func popFirst() -> Int? {
            let value = head?.value
            head?.next?.previous = nil
            head = head?.next
            if head == nil {
                tail = nil
            }
            return value
        }

        func popLast() -> Int? {
            let value = tail?.value
            tail?.previous?.next = nil
            tail = tail?.previous
            if tail == nil {
                head = nil
            }
            return value
        }

        func peek() -> Int? {
            head?.value
        }

        func last() -> Int? {
            tail?.value
        }
    }
    class Solution {
        func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
            var leftIndex = 0
            var output: [Int] = []
            let queue = Deque()
            for rightIndex in 0..<nums.count {
                while let last = queue.last(), nums[last] < nums[rightIndex] {
                    _ = queue.popLast()
                }

                queue.pushBack(value: rightIndex)

                if leftIndex > queue.peek()! {
                    _ = queue.popFirst()
                }

                if rightIndex + 1 >= k {
                    output.append(nums[queue.peek()!])
                    leftIndex += 1
                }
            }

            return output
        }
    }
}

/*
 let inputs = [
     (([1, 2, 3], 2), [2, 3]),
     (([1,3,-1,-3,5,3,6,7], 3), [3,3,5,5,6,7]),
     (([1, -1], 1), [1, -1]),
     (([7,2,4], 2), [7,4]),
     (([1,3,1,2,0,5], 3), [3,3,2,5])
  ]

  inputs.forEach { (input, result) in
      let solution = __239.Solution()
      let output = solution.maxSlidingWindow(input.0, input.1)

      print(output == result)
  }

 */
