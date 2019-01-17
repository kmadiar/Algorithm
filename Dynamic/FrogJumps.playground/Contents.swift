import UIKit

// The frog and the stones

let frogCanJump = 3
let numberOfStones = 6

func numberOfWays(jumps: Int, numberOfStones: Int) -> Int {
    var a = [1]
    
    for i in 1...numberOfStones {
        a.append(0)
        for j in 1...min(i, jumps) {
            a[i] = a[i] + a[i-j]
        }
    }
    return a.last ?? 0
}

print(numberOfWays(jumps: frogCanJump, numberOfStones: numberOfStones))
