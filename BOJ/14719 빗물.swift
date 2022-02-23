// Logic
// 1. 현재 위치기준 왼쪽 최대 높이, 오른쪽 최대 높이를 구한다
// 2. 현재 값이 (왼쪽 최대 높이, 오른쪽 최대 높이).min 보다 작은 경우 빗물이 들어갈 수 있기에 연산 진행
// 3. lhs, rhs는 이동하면서 계속 업데이트

// Solution
import Foundation

var size = readLine()!.split(separator: " ").map { Int(String($0))! }
var rain = readLine()!.split(separator: " ").map { Int(String($0))! }
var total = 0
var lhs = rain[0]

for i in 1..<rain.count-1 {
    let rhs = rain[i+1..<rain.count].max()!
    
    if rain[i] < min(lhs, rhs) {
        total += min(lhs, rhs) - rain[i]
    }
    
    lhs = max(lhs, rain[i])
}

print(total)
