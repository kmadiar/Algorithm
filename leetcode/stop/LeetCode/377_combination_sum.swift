//
//  377_combination_sum.swift
//  stop
//
//  Created by Kostiantyn Madiar on 05.08.2022.
//

import Foundation

enum __377 {
    class Solution {
        func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
            var output: [Int] = .init(repeating: 0, count: target + 1)
            output[0] = 1
            for i in 1...target {
                for value in nums {
                    if value <= i {
                        output[i] &+= output[i - value]
                    }
                }
            }

            return output[target]
        }
    }
}

//let solution377 = __377.Solution()
//let inut = [10,20,30,40,50,60,70,80,90,100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300,310,320,330,340,350,360,370,380,390,400,410,420,430,440,450,460,470,480,490,500,510,520,530,540,550,560,570,580,590,600,610,620,630,640,650,660,670,680,690,700,710,720,730,740,750,760,770,780,790,800,810,820,830,840,850,860,870,880,890,900,910,920,930,940,950,960,970,980,990,111]
//
//[(inut, 999),
// ([1,2,3], 4)].forEach {
//    print(solution377.combinationSum4($0.0, $0.1))
//}

//let solution108 = __108.Solution()
//
//solution108.sortedArrayToBST([-5,-4,-3,-2,-1,0,1,2,3,4,5])



