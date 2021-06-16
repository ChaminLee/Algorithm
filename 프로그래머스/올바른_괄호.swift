import Foundation

func solution(_ s:String) -> Bool {
    // 올바른지 여부를 체크
    var state = true
    // 괄호의 연산 값
    var res = 0
    
    for bracket in s {
        // 도중에 합이 0보다 작아질 경우 )가 (보다 많아지는 상황
        if res < 0 {
            state = false
            break
        }
        // "(" 이라면 +1, ")"일 경우 -1
        res += bracket == "(" ? 1 : -1
    }
    // 최종적으로 0보다 크다면 (가 남는 상황인 것
    if res != 0 {
        state = false
    }
    
    return state
}
