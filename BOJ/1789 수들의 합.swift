// Logic
// 1. 최대 개수를 구해야하기 때문에 최소인 1부터 합을 구하기 시작
// 2. 합이 타겟 수를 넘어가게 되는 경우, 종료
// 3. 현재합이 타겟과 같다면 개수 그대로 반환, 합이 타겟보다 더 크다면 1 빼주기 (넘는 만큼에 해당하는 자연수를 제외하면 되기에)

// Solution
import Foundation

let target = Int(readLine()!)!
var answer = 0
var number = 1
var count = 0

for i in 1...target {
    answer += i
    count += 1
    if answer >= target {
        break
    }
}

let result = answer == target ? count : count - 1
print(result)
