import UIKit

var str = "Hello, Fibonacci"

func recursiveFib(n: Int) -> Int {
    if n == 1 || n == 2 {
        return 1
    }
    
    return recursiveFib(n: n - 1) + recursiveFib(n: n - 2)
}

print(recursiveFib(n: 10))

func dynamicFib(n: Int) -> Int {
    var fib = [Int]()
    if n < 3 {
        return 1
    }
    
    fib.append(1)
    fib.append(1)
    
    for i in 2...(n-1) {
        fib.append( fib[i - 1] + fib[i - 2] )
    }
    
    return fib.last ?? 0
}

print(dynamicFib(n: 10))
