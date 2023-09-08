//
//  23_valid_sudoku.swift
//  stop
//
//  Created by Kostiantyn Madiar on 14.07.2023.
//

import Foundation

/*
 36. Valid Sudoku
 Medium
 Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

 Each row must contain the digits 1-9 without repetition.
 Each column must contain the digits 1-9 without repetition.
 Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
 Note:

 A Sudoku board (partially filled) could be valid but is not necessarily solvable.
 Only the filled cells need to be validated according to the mentioned rules.


 Example 1:


 Input: board =
 [["5","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: true
 Example 2:

 Input: board =
 [["8","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: false
 Explanation: Same as Example 1, except with the 5 in the top left corner being modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
 */

enum __36 {
    class Solution {
        struct Square: Hashable {
            let column: Int
            let row: Int
        }
        func isValidSudoku(_ board: [[Character]]) -> Bool {
            var rows: [Int: Set<Character>] = [:]
            var columns: [Int: Set<Character>] = [:]
            var squares: [Square: Set<Character>] = [:]

            for column in 0..<board.count {
                for row in 0..<board[column].count {
                    let character = board[row][column]
                    if character == "." { continue }
                    if hasDuplicate(dictionary: &columns,
                              key: column,
                              character: character)
                        || hasDuplicate(dictionary: &rows,
                                        key: row,
                                        character: character)
                        || hasDuplicate(dictionary: &squares,
                                        key: .init(column: column / 3,
                                                   row: row / 3),
                                        character: character) {
                        return false
                    }
                }
            }

            return true
        }

        func hasDuplicate<T>(dictionary: inout [T: Set<Character>],
                             key: T,
                             character: Character)
        -> Bool {
            if var columnSet = dictionary[key] {
                if columnSet.contains(character) {
                    return true
                } else {
                    dictionary[key]?.insert(character)
                }
            } else {
                var set: Set<Character> = .init()
                set.insert(character)
                dictionary[key] = set
            }
            return false
        }
    }
}
