import Foundation

let n = Int(readLine()!)!

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

var arr = readLine()!.split(separator: " ").map { Int(String($0))! }
print(arr.filter { isPrime($0) }.count)
