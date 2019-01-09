import UIKit

let a = 30
let b = 150

func evklid(a: Int, b: Int) -> Int {
    if b == 0 {
        return a
    }
    
    let x = a % b
    
    return evklid(a: b, b: x)
}

print(evklid(a: b, b: a), terminator: "")
