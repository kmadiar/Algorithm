import UIKit

// The frog and the stones

let frogCanJump = 3
let numberOfStones = 4

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

func canOnlyJump(k: Int, numberOfStones: Int) -> Int {
    var a = [1, 1]
    
    for i in 2...numberOfStones {
        a.append(0)
        for j in 1...k {
            if (i % j == 0) {
                a[i] = a[i] + a[i % j]
            }
        }
    }
    
    return a.last!
}


print(canOnlyJump(k: frogCanJump, numberOfStones: numberOfStones))


let missedStones = [2]

func numberOfWaysMissedStones(_ missed: [Int], jumps: Int, numberOfStones: Int) -> Int {
    var a = [1]
    
    for i in 1...numberOfStones {
        a.append(0)
        if missed.contains(i) {
            continue
        }
        for j in 1...min(i, jumps) {
            a[i] = a[i] + a[i-j]
        }
    }
    return a.last ?? 0
}

print(numberOfWaysMissedStones(missedStones, jumps: frogCanJump, numberOfStones: numberOfStones))
