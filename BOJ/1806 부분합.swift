// MARK: - 부분합
// Logic
// 1. 좌측, 우측 인덱스를 둔다.
// 2. 우측은 항상 좌측보다 커야하고, 합을 누적해나간다
// 3. 타겟보다 합이 크거나 같은 경우 최소 길이를 저장하고, 더 줄일 수 있는지 보기 위헤 lhs를 우측으로 땡긴다
// 4. 타겟보다 합이 작은 경우 더 더해줘야 하기에 rhs를 우측으로 땡겨준다.
// 5. 타겟보다 합이 작은 경우인데 rhs가 n과 같아지는 경우(끝) 종료

// Solution
import Foundation

var input = readLine()!.split(separator: " ").map { Int(String($0))! }
let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], target = input[1]
var minSubtotal = Int.max
var subtotal = arr[0]
var lhs = 0, rhs = 1

while lhs < rhs {
    if subtotal >= target {
        minSubtotal = min(minSubtotal, rhs - lhs)
        subtotal -= arr[lhs] // 다음 케이스 이동
        lhs += 1
    } else {
        if rhs == n {
            break
        }
        subtotal += arr[rhs] // 다음 케이스 이동
        rhs += 1
    }
}

print(minSubtotal == Int.max ? 0 : minSubtotal)
