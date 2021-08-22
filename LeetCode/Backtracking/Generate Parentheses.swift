// solution 1 
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {     
        var result = ["("]
        
        for i in 0..<n*2-1 {
            var temp = [String]()
            for res in result {
                temp.append(res + "(")
                temp.append(res + ")")
            }
            result = temp 
        }
        
        return result.filter { isParentheses($0) }
    }
    
    func isParentheses(_ str: String) -> Bool {
        var cnt = 0
        for s in str {
            cnt += s == "(" ? 1 : -1
            if cnt < 0 {
                return false
            }
        }
        return cnt == 0
    }
}

// solution 2 - backtracking
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {     
        var result = [String]()
        DFS(n,n,"",&result)
                
        return result
    }
    
    func DFS(_ open: Int, _ close: Int, _ str: String, _ answer: inout [String]) {
        // 모두 다 사용하면 추가
        if open == 0 && close == 0 {
            answer.append(str)
            return 
        }
        
        // ((의 경우는 완성될 가능성이 있기에 그대로 패스
        if open > close {
            return 
        }
        
        // (에 (와 )가 붙는 두 가지 상황을 고려해줘야 함 
        // open이 1개 이상이라면, 1개 사용하고 str에 (를 붙여준다.
        if open > 0 {
            DFS(open-1,close,str+"(",&answer)
        }
        
        // close가 1개 이상이라면, 1개 사용하고 str에 )를 붙여준다.
        if close > 0 {
            DFS(open,close-1,str+")",&answer)
        }
    }
}
