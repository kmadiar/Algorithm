//
//  20_valid_parentheses.swift
//  stop
//
//  Created by Kostiantyn Madiar on 18.07.2023.
//

import Foundation

/*
 20. Valid Parentheses
 Easy
 20.9K
 1.3K
 Companies
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

 An input string is valid if:

 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Every close bracket has a corresponding open bracket of the same type.


 Example 1:

 Input: s = "()"
 Output: true
 Example 2:

 Input: s = "()[]{}"
 Output: true
 Example 3:

 Input: s = "(]"
 Output: false


 Constraints:

 1 <= s.length <= 104
 s consists of parentheses only '()[]{}'.
 */

enum __20 {
    class Stack {
        var head: StackNode?

        func push(value: Character) {
            let node = StackNode(value: value)
            node.next = head
            head = node
        }

        func pop() -> Character? {
            let value = head?.value

            head = head?.next

            return value
        }

        func peek() -> Character? {
            head?.value
        }

        func isEmpty() -> Bool {
            peek() == nil
        }

        class StackNode {
            init(value: Character,
                 next: StackNode? = nil) {
                self.value = value
                self.next = next
            }

            let value: Character
            var next: StackNode?
        }
    }
    class Solution {
        func isValid(_ s: String) -> Bool {
            let stack = Stack()

            for character in s {
                if let peekValue = stack.peek() {
                    if isLeft(character: character) {
                        stack.push(value: character)
                    } else {
                        guard let peekValue = stack.pop(),
                        isPair(left: peekValue, right: character) else { return false }
                    }
                } else {
                    stack.push(value: character)
                }
            }

            return stack.isEmpty()
        }

        func isPair(left: Character, right: Character) -> Bool {
            pairs.contains([left, right])
        }

        func isLeft(character: Character) -> Bool {
            Self.leftCharacters.contains(character)
        }

        lazy var pairs: Set<[Character]> = {
            var set: Set<[Character]> = .init()
            for index in 0..<Self.leftCharacters.count {
                set.insert([Self.leftCharacters[index], Self.rightCharacters[index]])
            }
            return set
        }()

        static let leftCharacters: [Character] = ["(", "{", "["]
        static let rightCharacters: [Character] = [")", "}", "]"]
    }
}

/*

 let inputs = [
     (("()"), true),
     (("()[]{}"), true),
     (("(]"), false)
  ]

  inputs.forEach { (input, result) in
      let solution = __20.Solution()
      let output = solution.isValid(input)

      print(output == result)
  }
 */
