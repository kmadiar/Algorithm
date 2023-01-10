//
//  stattree.swift
//  stop
//
//  Created by Kostiantyn Madiar on 03.08.2022.
//

import Foundation

//class MyCalendar {
//    var root: Node?
//
//    init() {
//
//    }
//
//    func book(_ start: Int, _ end: Int) -> Bool {
//        guard let currentNode = root else {
//            root = .init()
//            root?.from = start
//            root?.to = end
//            return true
//        }
//        return check(start, end: end, node: currentNode)
//    }
//
//    func check(_ start: Int, end: Int, node: Node) -> Bool {
//        if start < node.from {
//            if end > node.from {
//                return false
//            }
//            if let left = node.left {
//                return check(start, end: end, node: left)
//            } else {
//                node.left = .init(from: start, to: end)
//                return true
//            }
//        }
//
//        if start < node.to {
//            return false
//        }
//        if let right = node.right {
//            return check(start, end: end, node: right)
//        } else {
//            node.right = .init(from: start, to: end)
//            return true
//        }
//    }
//}
//
//class Node {
//    internal init(from: Int = 0, to: Int = 0, left: Node? = nil, right: Node? = nil) {
//        self.from = from
//        self.to = to
//        self.left = left
//        self.right = right
//    }
//
//    var from: Int = 0
//    var to: Int = 0
//    var left: Node?
//    var right: Node?
//}


//let myCalendar = MyCalendar()
//print(myCalendar.book(10, 20)) // return True
//print(myCalendar.book(15, 25)) // return False, It can not be booked because time 15 is already booked by another event.
//print(myCalendar.book(20, 30)) // return True, The event can be booked, as the first event takes every time less than 20, but not including 20.
//let solution69 = __69.Solution()
//print(solution69.mySqrt(8))

