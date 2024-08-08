//
//  main.swift
//  stop
//
//  Created by Kostiantyn Madiar on 05.07.2022.
//

//let inputs = [
////    [4,2,5,3],
////    [1,2,3,5,6],
//    [1,10,100,1000]
//]
//
//let expectations = [
////    0,
////    1,
//    3
//]
//
//zip(inputs, expectations)
//    .forEach { input, expected in
//        let output = __2009.Solution().minOperations(input)
//
//        print(output == expected)
//    }

import Foundation

//for _ in 1...20 {
//    let timestamp = Int(Date.timeIntervalSinceReferenceDate.hashValue)
//    print(abs(timestamp) % 4)
//}


let smth = ["a", "a", "v"]

print(smth.concat())

extension Array where Element == String {
    func concat() -> String {
        reduce("", { partialResult, next in
            partialResult + next
        })
    }
}
