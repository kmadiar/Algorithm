//
//  1268_search_suggestion_system.swift
//  stop
//
//  Created by Kostiantyn Madiar on 19/09/2023.
//

import Foundation

/*

 1268. Search Suggestions System
 Medium
 You are given an array of strings products and a string searchWord.

 Design a system that suggests at most three product names from products after each character of searchWord is typed. Suggested products should have common prefix with searchWord. If there are more than three products with a common prefix return the three lexicographically minimums products.

 Return a list of lists of the suggested products after each character of searchWord is typed.



 Example 1:

 Input: products = ["mobile","mouse","moneypot","monitor","mousepad"], searchWord = "mouse"
 Output: [["mobile","moneypot","monitor"],["mobile","moneypot","monitor"],["mouse","mousepad"],["mouse","mousepad"],["mouse","mousepad"]]
 Explanation: products sorted lexicographically = ["mobile","moneypot","monitor","mouse","mousepad"].
 After typing m and mo all products match and we show user ["mobile","moneypot","monitor"].
 After typing mou, mous and mouse the system suggests ["mouse","mousepad"].
 Example 2:

 Input: products = ["havana"], searchWord = "havana"
 Output: [["havana"],["havana"],["havana"],["havana"],["havana"],["havana"]]
 Explanation: The only word "havana" will be always suggested while typing the search word.


 Constraints:

 1 <= products.length <= 1000
 1 <= products[i].length <= 3000
 1 <= sum(products[i].length) <= 2 * 104
 All the strings of products are unique.
 products[i] consists of lowercase English letters.
 1 <= searchWord.length <= 1000
 searchWord consists of lowercase English letters.

 */

enum __1268 {
    class Solution {
        func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
            let tree = TrieTree()
            products.forEach(tree.insert(word:))

            var output: [[String]] = []
            for index in 0..<searchWord.count {

                let prefix = String(Array(searchWord)[0...index])
                output.append(Array(tree.find(prefix: prefix).prefix(3)))
            }

            return output
        }
    }

    class TrieTree {
        class Node {
            init(key: Character? = nil,
                 value: String? = nil) {
                self.key = key
                self.value = value
            }
            let key: Character?
            var value: String?
            var children: [Character: Node] = [:]

            func allValues() -> [String] {
                var output: [String] = []

                for child in children.values {
                    if let value = child.value {
                        output.append(value)
                    }
                    output.append(contentsOf: child.allValues())
                }

                return output
            }
        }

        let root = Node()

        func insert(word: String) {
            guard !word.isEmpty else { return }
            let characters = Array(word)

            var currentNode = root
            var currentIndex = 0

            while currentIndex < characters.count {

                let currentCharacter = characters[currentIndex]

                if let childNode = currentNode.children[currentCharacter] {
                    currentNode = childNode
                } else {
                    let newNode = Node(key: currentCharacter)
                    currentNode.children[currentCharacter] = newNode
                    currentNode = newNode
                }

                currentIndex += 1
            }

            currentNode.value = word
        }

        func find(prefix: String) -> [String] {
            let characters = Array(prefix)

            var currentIndex = 0
            var currentNode = root
            var output: [String] = []
            while currentIndex < characters.count {
                let currentCharacter = characters[currentIndex]
                if let childNode = currentNode.children[currentCharacter] {
                    currentNode = childNode
                } else {
                    return []
                }

                currentIndex += 1
            }
            if let value = currentNode.value {
                output.append(value)
            }
            output.append(contentsOf: currentNode.allValues())

            return output.sorted(by: <)
        }
    }
}

/*
 let inputs = [
     (["mobile","mouse","moneypot","monitor","mousepad"], "mouse")
 ]

 let expected = [
     [["mobile","moneypot","monitor"],["mobile","moneypot","monitor"],["mouse","mousepad"],["mouse","mousepad"],["mouse","mousepad"]]
 ]


 zip(inputs, expected)
     .forEach { input, expected in
         let solution = __1268.Solution()
         let result = solution.suggestedProducts(input.0, input.1)
         print(result == expected)
         print(result)
         print(expected)
     }

 */
