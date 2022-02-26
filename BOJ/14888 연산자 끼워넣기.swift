// Logic
// 1. backtracking 문제
// 2. 최대, 최소값을 미리 정해둔다.
// 3. 우선 연산자들을 모두 돌며 연산을 해주며 연산자 개수를 1개 빼고, 재귀를 마치면 연산자 개수를 다시 되돌려놓는다.
// 4. idx와 주어진 수의 개수(n)이 같을 때, 즉 모든 수로 연산을 마쳤을 때 최대,최소를 비교한다

// Solution
import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var ops = readLine()!.split(separator: " ").map { Int(String($0))! }
var maxNum = Int.min, minNum = Int.max

func dfs(_ idx: Int, _ current: Int) {
    if idx == n {
        maxNum = max(maxNum, current)
        minNum = min(minNum, current)
    }
         
    for i in 0..<4 {
        if ops[i] > 0 {
            ops[i] -= 1
            var newValue = 0
            switch i {
            case 0:
                newValue = current + numbers[idx]
            case 1:
                newValue = current - numbers[idx]
            case 2:
                newValue = current * numbers[idx]
            case 3:
                newValue = current / numbers[idx]
            default:
                break
            }
            
            dfs(idx+1, newValue)
            ops[i] += 1
        }
    }
}

dfs(1, numbers[0])

print(maxNum)
print(minNum)

