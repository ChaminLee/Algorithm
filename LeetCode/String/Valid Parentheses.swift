class Solution {
    func isValid(_ s: String) -> Bool {
        // character를 담을 Stack
        var stack = [Character]()
        
        // 하나하나 비교
        for str in s {
            // stack의 마지막 요소가
            if let last = stack.last { 
                // 여는 괄호일 때 짝이 맞다면 기존 값(last)과 들어올 값 모두 제거
                if last == "(" && str == ")" {
                    stack.popLast()
                } else if last == "{" && str == "}" {
                    stack.popLast()
                } else if last == "[" && str == "]" {
                    stack.popLast()
                // 세 경우가 아닌 경우 str을 추가     
                } else {
                    stack.append(str)
                }
            } else {
                stack.append(str)
            }
        }
            
        // stack이 이미 다 사라지고 없어야 올바른 괄호인 것
        return stack == [] ? true : false
    }
}
