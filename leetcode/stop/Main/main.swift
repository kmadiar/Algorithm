//
//  main.swift
//  stop
//
//  Created by Kostiantyn Madiar on 05.07.2022.
//

//let inputs = [
//    (([[1,2,7], [3, 6, 7]], 1, 6), 2),
//    (([[7,12],[4,5,15],[6],[15,19],[9,12,13]], 15, 12), -1)
// ]
//
// inputs.forEach { (input, result) in
//     let solution = __815.Solution()
//     let output = solution.numBusesToDestination(input.0, input.1, input.2)
//
//     print(output == result)
// }

let inputs = [
    (("ABAB", 2), 4),
    (("AABABBA", 1), 4),
 ]

 inputs.forEach { (input, result) in
     let solution = __424.Solution()
     let output = solution.characterReplacement(input.0, input.1)

     print(output == result)
 }
