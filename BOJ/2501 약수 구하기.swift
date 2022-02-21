import Foundation
let input = readLine()!.split(separator: " ").map { Int(String($0))! }

var cnt = 0, result = 0

for i in 1...input[0] {
    if input[0] % i == 0 {
        cnt += 1
    }
    
    if cnt == input[1] {
        result = i
        break
    }
}

print(result)
