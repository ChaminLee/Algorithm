import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var minPrime = Int.max
var sum = 0

func isPrime(_ m: Int) -> Bool {
    if m < 2 { return false }
    
    var i = 2
    
    while Int(sqrt(Double(m))) >= i {
        if m % i == 0 {
            return false
        }
        i += 1
    }
    
    return true
}

(n...m).forEach {
    if isPrime($0) {
        minPrime = min(minPrime, $0)
        sum += $0
    }
}

if minPrime == Int.max {
    print(-1)
} else {
    print(sum)
    print(minPrime)
}
