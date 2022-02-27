// Logic
// 1. 문자열의 개수, 유일한 문자열의 개수가 같은지 먼저 확인한다. 
// 2. 딕셔너리를 이용해서 매칭되는 값을 비교한다. abb abc 인 경우 마지막 b -> c가 기존의 b -> b와 달라 패스
// 3, 매칭된 결과만 담아준다. 

// Solution
class Solution {
    func findAndReplacePattern(_ words: [String], _ pattern: String) -> [String] {
        var result = [String]()
        
        for word in words {
            if word.count != pattern.count || Set(word).count != Set(pattern).count {
                continue 
            }

            if match(word, pattern) {
                result.append(word)    
            }            
        }
                
        return result
    }
    
    func match(_ word: String, _ pattern: String) -> Bool {
        var matches = [Character:Character]()
        for (w, p) in zip(word, pattern) {
            if let value = matches[p] {
                if value != w {                        
                    return false
                } 
            } else {
                matches[p] = w
            }
        }    
        return true
    }
}
