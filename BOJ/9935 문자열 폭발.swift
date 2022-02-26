// Logic
// 1. 문자열을 하나씩 추가한다.
// 2. 마지막 문자가 폭발 문자열의 마지막과 같은지 비교한다
// 3. 맞다면 현재 개수가 폭발 개수보다 큰지, 폭발 문자열이 현재 문자열 마지막부분과 같은지 확인한다
// 4. 같다면 제거
// 5. 최종적으로 비어있다면 FRULA, 아니라면 stack 출력

// Solution
import Foundation

var strings = readLine()!.map { String($0) }
var key = readLine()!
var keyLen = key.count
let lastKey = String(key.last!)
var stack = [String]()

for s in strings {
    stack.append(s)
    
    if s == lastKey {
        let cnt = stack.count
        if cnt >= keyLen && stack[(cnt-keyLen)...].joined() == key {
            (0..<keyLen).forEach { _ in
                stack.removeLast()
            }
        }
    }
}

print(stack == [] ? "FRULA" : stack.joined())
