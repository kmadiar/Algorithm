//
//  main.swift
//  stop
//
//  Created by Kostiantyn Madiar on 05.07.2022.
//

let inputs = [
     ([[1,3],[2,6],[8,10],[15,18]], [[1,6],[8,10],[15,18]]),
     ([[1,4],[4,5]], [[1,5]]),
 ]

 inputs.forEach { (input, result) in
     let solution = __56.Solution()
     let output = solution.merge(input)

     print(output == result)
 }
