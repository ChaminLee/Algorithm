class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        // key & value로 묶기 위해 dictionary 사용
        var dic = [Character:Int]()
        
        // 원 배열에서 등장한 만큼 1씩 추가
        for c in s {
            dic[c, default:0] += 1
        }
        
        // 뒤죽박죽된 배열에서 등장한 만큼 1씩 빼기
        for c in t {
            dic[c, default:0] -= 1
        }
        
        // 모든 Value가 0이어야 Anagram이다. 
        for (k,v) in dic {
            if v != 0 {
                return false
            }
        }
        return true
    }
}
