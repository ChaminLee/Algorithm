class Solution {
    func letterCasePermutation(_ s: String) -> [String] {  
        // 인덱싱하기 위함
        var temp = Array(s)
        var result = [String]()
        
        // backtracking
        func backtrack(_ idx: Int, _ path: [Character], _ target: String) {
            // 크기가 같아지면 추가 
            if idx == path.count {
                result.append(target)
                return 
            }
        
            if path[idx].isLetter {
                // 소문자 케아스
                backtrack(idx+1, path, target + String(path[idx].lowercased()))
                // 대문자 케아스
                backtrack(idx+1, path, target + String(path[idx].uppercased()))
            } else {
                // 숫자는 그냥 넘김
                backtrack(idx+1, path, target + String(path[idx]))
            }
        }
        
        backtrack(0, temp, "")
                
        return result
    }
}
