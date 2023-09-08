//
//  14_trie_tree.swift
//  stop
//
//  Created by Kostiantyn Madiar on 22.08.2022.
//

import Foundation

enum __14 {
    class Solution {

        let tree = Tree<String>()

        func longestCommonPrefix(_ strs: [String]) -> String {
            strs.forEach { key in
                tree.insert(key: "\(key)\(Date().timeIntervalSince1970)", value: key)
            }


            let sorted = strs.sorted(by: <)
            if let first = sorted.first, first.count > 0 {
                let characters = Array(first.lowercased())

                var currentIndex = 1

                if characters.count == 1 {
                    if tree.filter(prefix: first).count != strs.count {
                        return ""
                    }
                    return first
                }

                while currentIndex <= characters.count {
                    let prefix = String(first.prefix(currentIndex))
                    if tree.filter(prefix: prefix).count < strs.count {
                        return String(prefix.dropLast())
                    }
                    currentIndex += 1
                }

                return first
            }
            return ""
        }
    }

    final class TrieNode<Key: Hashable, Value> {
      var key: Key?
      var value: Value?
      var children: [Key: TrieNode] = [:]

      init(key: Key? = nil, value: Value? = nil) {
        self.key = key
        self.value = value
      }

      func add(child: Key, value: Value?) {
        guard children[child] == nil else { return }

        children[child] = TrieNode(key: child, value: value)
      }
    }

    final class Tree<Value> {
      private let root = TrieNode<Character, Value>()

      func insert(key: String, value: Value) {
        guard !key.isEmpty else { return }

        var currentNode = root
        let characters = Array(key.lowercased())
        var currentIndex = 0

        while currentIndex < characters.count {
          let character = characters[currentIndex]

          if let child = currentNode.children[character] {
            currentNode = child
          } else {
            currentNode.add(child: character, value: nil)
            currentNode = currentNode.children[character]!
          }

          currentIndex += 1
        }

        if currentIndex == characters.count {
          currentNode.value = value
        }
      }

      func filter(prefix: String) -> [Value] {
        var currentNode = root
        let characters = Array(prefix.lowercased())
        var currentIndex = 0

        while currentIndex < characters.count, let child = currentNode.children[characters[currentIndex]] {
          currentIndex += 1
          currentNode = child
        }

        if currentIndex == characters.count {
          return search(String(prefix.dropLast()), node: currentNode)
        }

        return []
      }

      func search(_ prefix: String, node: TrieNode<Character, Value>) -> [Value] {
        var output: [Value] = []

        var newPrefix = prefix
        if let key = node.key {
          newPrefix = String(key)
        }

        if let value = node.value {
          output.append(value)
        }

        return output + node.children.map { search(newPrefix, node: $1) }.flatMap { $0 }
      }
    }
}


class TrieTree {
    class Node {
        var key: Character?
        var value: String?
        var children: [Character: Node] = [:]

        init(key: Character? = nil, value: String? = nil) {
            self.key = key
            self.value = value
        }

        func add(key: Character, value: String? = nil) -> Node {
            let childNode = children[key]
            if let childNode = childNode { return childNode }

            let newNode: TrieTree.Node = .init(key: key, value: value)

            children[key] = newNode

            return newNode
        }

        func allValues() -> [String] {
            var output: [String] = []
            let node = self
            if let value = node.value {
                output.append(value)
            }

            return output + allChildrenValues(for: node)
        }

        func allChildrenValues(for node: Node) -> [String] {
            var output: [String] = []
            node.children.forEach { _, childNode in
                if let token = childNode.value {
                    output.append(token)
                }
                output += allChildrenValues(for: childNode)
            }

            return output
        }
    }

    var root = Node()

    func insert(token: String) {
        guard !token.isEmpty else { return }

        let characters = Array<Character>(token)
        var currentNode = root
        var currentIndex = 0

        while currentIndex < characters.count {

            let character = characters[currentIndex]
            let childNode = currentNode.add(key: character)
            currentNode = childNode
            currentIndex += 1
        }
        currentNode.value = token
    }

    func search(prefix: String) -> [String] {
        guard !prefix.isEmpty else { return [] }

        let characters = Array<Character>(prefix)
        var currentNode: TrieTree.Node? = root
        var currentIndex = 0

        while currentIndex < characters.count {
            let character = characters[currentIndex]
            let childNode = currentNode?.children[character]

            currentNode = childNode
            currentIndex += 1
        }

        return currentNode?.allValues() ?? []
    }

    func delete(token: String) {
        let characters: [Character] = Array(token)
        var currentIndex = 0
        var currentNode = root
        while currentIndex < characters.count {
            let character = characters[currentIndex]
            if let childNode = currentNode.children[character] {
                currentNode = childNode
            } else {
                return
            }
            currentIndex += 1
        }

        if currentNode.value != nil {
            currentNode.value = nil
        }
    }

    func allValues() -> [String] {
        root.allValues()
    }
}

//let solution14 = __14.Solution()
//
//let strs = ["zalasdsad", "zassla", "zalsd"]
//print(solution14.longestCommonPrefix(strs))
//
//let strs2 = ["ab", "a"]
//print(solution14.longestCommonPrefix(strs2))
//
//let strs3 = ["flower", "flower", "flower"]
//print(solution14.longestCommonPrefix(strs3))
//
//let strs4 = ["a", "b"]
//print(solution14.longestCommonPrefix(strs4))
//
//let strs5 = ["aa", "ab"]
//print(solution14.longestCommonPrefix(strs5))
