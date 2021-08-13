class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        // 비었을 경우 공백 리턴
        if digits.isEmpty { return [] }
        
        let dict = ["2": ["a","b","c"], "3": ["d","e","f"], "4": ["g","h","i"], "5": ["j","k","l"], "6": ["m","n","o"], "7": ["p","q","r","s"], "8": ["t","u","v"], "9": ["w","x","y","z"]]
                
        // 경우의 수 한 케이스 저장
        var path = ""
        // 모든 경우의 수 저장
        var ans = [String]()
        // 인덱스 접근 가능하도록 문자열 변환
        let digits = digits.map { String($0) }
        
        // DFS + Backtracking
        func DFS(_ idx: Int, _ path: inout String, _ result: inout [String]) {
            // idx == digits 길이일 경우
            if idx == digits.count {
                // 결과에 붙이고 반환
                result.append(path)
                return
            }
                        
            // 알맞는 번호의 문자열을 돌며
            for v in dict[digits[idx]]! {
                path.append(v)
                // 다음 인덱스, 기존 path, result는 그대로 들고감 
                DFS(idx + 1, &path, &result)
                // backtracking, 맨 뒤의 원소 제거해주고, 나머지 경우의 수 또 찾으로 고고
                path.removeLast()
            }
        }
        
        DFS(0,&path,&ans)
        
        return ans
    }
}
