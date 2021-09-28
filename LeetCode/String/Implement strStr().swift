// Simple two pointers
class Solution2 {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        // needle이 비어있다면 0
        if needle.isEmpty { return 0 }
        // needle이 haystack보다 크다면 -1
        if needle.count > haystack.count { return -1 }
        
        // 현재 인덱스, 구간의 시작/끝
        var now = 0
        var start = haystack.startIndex
        var end = haystack.index(start, offsetBy: needle.count - 1)
        
        // 범위까지
        while end < haystack.endIndex {
            let target = haystack[start...end]
            
            if target == needle {
                return now            
            }
            
            start = haystack.index(after: start)
            end = haystack.index(after: end)            
            now += 1
        }
        
        return -1
    }
}

// KMP 
class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let needle = needle.map { String($0) }
        let haystack = haystack.map { String($0) }
        let table = getPattern(needle)
        
        let res = kmp(haystack, needle, table)
        
        guard let v = res else {
            return -1
        } 
        
        return v.0
    }
    
    // 겹치는 접두사 접미사 찾기 
    func getPattern(_ pattern: [String]) -> [Int] {
        var table = Array(repeating: 0, count: pattern.count)
        var i = 1, j = 0
        let n = pattern.count 

        while i < n {
            if pattern[i] == pattern[j] {
                table[i] = j + 1
                i += 1
                j += 1
            } else if j > 0 {
                j = table[j-1]
            } else {
                table[i] = j
                i += 1
                j = 0
            }
        }

        return table
    }
    
    // pattern을 이용하여 사전에 겹치는 부분은 뛰어넘기 
    func kmp(_ words: [String], _ pattern: [String], _ table: [Int]) -> (Int,Int)? {
        guard !pattern.isEmpty else { return (0,0) }
        // i는 words 인덱스, j는 pattern 인덱스
        var i = 0, j = 0
        
        while i < words.count && j < pattern.count {
            if words[i] == pattern[j] {
                i += 1
                j += 1
            } else if j == 0 {
                i += 1
            } else {
                j = table[j-1]
            }
        }
        
        // 시작 끝
        return j == pattern.count ? (i-j, i-1) : nil
    }
}
