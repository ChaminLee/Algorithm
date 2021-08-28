// solution 1
class Solution {
    func reverseWords(_ s: String) -> String {
        var words = s.components(separatedBy: " ")
        var result = ""
        
        for i in 0..<words.count {            
            var w = words[i].map { String($0) }
            reverseString(&w)
                
            if i == words.count - 1 {
                result += w.joined()    
            } else {
                result += (w.joined() + " ")
            }
        }
        return result
    }
    
    // 문자열 배열 뒤집기 (Two-Pointers)
    func reverseString(_ s: inout [String]) {
        var left = 0, right = s.count - 1
        
        while left < right {
            let temp = s[left]
            s[left] = s[right]
            s[right] = temp
            
            left += 1
            right -= 1
        }
    }
}


// solution with 1-line
class Solution {
    func reverseWords(_ s: String) -> String {
        return s.components(separatedBy: " ").map { String($0.reversed()) }.joined(separator: " ")
    }
}
