class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxsub = 0, sub = [Character]()
        s.map { 
            if sub.contains($0) {
                sub.removeSubrange(0...sub.firstIndex(of: $0)!)
            } 
            sub.append($0)
            maxsub = max(maxsub, sub.count)
        }
        return maxsub
    }
}

// solution 추가 
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // 인덱스 접근을 하기 위함
        var str = s.map { String($0) }        
        // 시작점, 인덱스, 결과값
        var start = 0, idx = 0, result = 0
        // 유일한지 확인하기 위한 딕셔너리
        var dict = [String:Int]()
        
        // 문자열 길이보다 낮도록
        while idx < str.count {
            // 값이 있다면 현재 딕셔너리 초기화 및 시작점 한 칸 이동 그리고 인덱스는 시작점으로
            if let val = dict[str[idx]] {
                dict.removeAll()
                start += 1
                idx = start
            // 값이 없었다면
            } else { 
                // 값 추가 
                dict[str[idx]] = 1
                // 인덱스 늘리기
                idx += 1
            }
            // 길이는 최댓값만 저장
            result = max(result, dict.values.count)
        }
        return result
    }
}
