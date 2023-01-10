//
//  858_mirror.swift
//  stop
//
//  Created by Kostiantyn Madiar on 04.08.2022.
//

import Foundation

enum __858 {
    class Solution {
        func mirrorReflection(_ p: Int, _ q: Int) -> Int {
            var p = p, q = q
            while (p % 2 == 0 && q % 2 == 0){
                p /= 2;
                q /= 2;
            }
            return 1 - p % 2 + q % 2;
        }
    }
}
