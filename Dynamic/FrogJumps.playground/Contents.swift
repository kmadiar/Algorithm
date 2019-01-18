import UIKit

// The frog and the stones

let frogCanJump = 3
let numberOfStones = 10
let coins = [0, 2, -3, 1, -2, 1, -1, 1, -1, 1, -1]
let missedStones = [2]

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

func frogAndCoins(_ coins: [Int], jumps: Int, numberOfStones: Int) -> Int {
    var a = [1]
    
    for i in 1...numberOfStones {
        let r = min(i, jumps)
        a.append(a[i-1] + coins[i])
        var from = i - 1
        for j in 1...r {
            if (a[i]) < (a[i-j] + coins[i]) {
                a[i] = a[i-j] + coins[i]
                from = i-j
            }
        }
        
        print("index \(from)")
    }
    return a.last ?? 0
    
    return 0
}

print(frogAndCoins(coins, jumps: frogCanJump, numberOfStones: numberOfStones) )
