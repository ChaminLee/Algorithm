import Foundation

func solution(_ s:String) -> Int {
    // 1개면 0 리턴
    if s.count == 1 { return 0 }    
    var str = s.map {String($0)}
    var res = 0
    
    for _ in 0..<str.count {
        // 처음 원소를 끝으로 이동
        str.append(str.removeFirst())
        // 올바른 배열인지 확인
        if isCorrect(str) {
            res += 1
        }
    }
    return res
}

// 올바른 배열인지 확인 
func isCorrect(_ str: [String]) -> Bool {
    // 첫 원소 저장
    var stack = [change(str[0])]

    // 다음에 올 값
    var next = 0
    // index 1부터 시작
    for s in str[1...] {        
        next = change(s)
        if let last = stack.last {
            // last가 } ) ] 인 경우
            if last < 0 {
                return false
            }
            
            // next가 ) } ] 일 경우 
            if next < 0 {
                // 더해서 무조건 한 쌍이 사라져야한다.
                // 아닐 경우 [(]) 와 같은 혼종이 탄생한다.
                if next + last == 0 {
                    // last가 stack에서 빠지고, next는 들어오지 않게 된다.
                    stack.removeLast()
                } else {
                    // 위 예외 케이스가 나오면 바로 false
                    return false
                }
            // ( { [ 인 경우는 우선 추가
            } else {
                stack.append(next)
            }
        // stack이 비었을 때
        } else {
            // 다음 값이 ) } ] 인 경우
            if next < 0 {
                return false
            // ( { [ 인 경우는 우선 추가
            } else {
                stack.append(next)
            }
        }
    }
    
    // stack이 비어있어야 올바른 배열
    return stack == [] ? true : false
}

// 특수문자를 정수로 변환
func change(_ s: String) -> Int {
    var next = 0
    if s == "[" || s == "]" {
        next = s == "[" ? 1 : -1
    } else if s == "{" || s == "}" {
        next = s == "{" ? 2 : -2
    } else if s == "(" || s == ")" {
        next = s == "(" ? 3 : -3
    }
    return next
}
