import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var n = input[0], m = input[1]

var maxNum = 1
var i = 1

while i <= max(n, m) {
    if (n % i == 0) && (m % i == 0) {
        maxNum *= i
        n /= i
        m /= i
        i = 1
    }
    i += 1
}

var minMum = maxNum * n * m

print(maxNum)
print(minMum)

// GCD, LCD 공식 풀이

import Foundation 

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var n = input[0], m = input[1]

func gcd(_ a: Int, _ b: Int) -> Int {
    let temp = a % b
    return temp == 0 ? min(a,b) : gcd(b, temp)
}

func lcd(_ a: Int, _ b: Int) -> Int {
    return (a * b) / gcd(a,b)
}

print(gcd(n,m))
print(lcd(n,m))
