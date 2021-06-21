class Solution {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        // 비어있어도 하위 배열 가능
        if s.isEmpty {
            return true
        }
        // 배열화
        var s = s.map { String($0) }
        // 현 위치
        var idx = 0
        
        // t를 돌며
        for w in t {
            // 같을 경우 다음 idx로
            if String(w) == s[idx] {
                idx += 1
            }           
            // idx가 s의 배열과 같다면 모두 순서대로 포함하고 있는 것 
            if idx == s.count {
                return true
            }
        }
        
        
        return false
    }
}
