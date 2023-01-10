//
//  841_keys_and_rooms.swift
//  stop
//
//  Created by Kostiantyn Madiar on 20.12.2022.
//

import Foundation

enum __841 {
    class Solution {
        func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
            guard !rooms.isEmpty else { return true }

            var visited = Array(repeating: false, count: rooms.count)

            var queue: [Int] = []
            queue.append(contentsOf: rooms[0])
            visited[0] = true

            func pop() -> Int {
                queue.removeFirst()
            }

            func push(_ element: Int) {
                queue.append(element)
            }

            var nextIndex = 0
            while !queue.isEmpty {
                nextIndex = pop()
                visited[nextIndex] = true
                let items = rooms[nextIndex]
                items.forEach { item in
                    if !visited[item] {
                        visited[item] = true
                        push(item)
                    }
                }
            }

            return visited
                .filter { $0 }
                .count == rooms.count
        }
    }
}

//let inputs = [
//    ([[1],[2],[3],[]], true),
//    ([[1,3],[3,0,1],[2],[0]], false)
//]
//
//inputs.forEach { input in
//    let solution = __841.Solution()
//
//    let output = solution.canVisitAllRooms(input.0)
//
//    print(output)
//    print(input.1 == output)
//}
