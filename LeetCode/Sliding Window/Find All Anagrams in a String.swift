class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {        
        var size = p.count
        var idx = 0
        var s = Array(s), p = Array(p)
        var result = [Int]()
        var dictS = [Character:Int](), dictP = [Character:Int]()
        
        // 미리 p 딕셔너리 추가
        for i in 0..<size {
            dictP[p[i], default: 0] += 1
        }
        
        while idx < s.count {
            
            // 사이즈 크기가 되면 가장 앞에 추가한 원소가 값이 1보다 클 경우 -1, 1이라면 nil하여 없애버린다.
            if idx >= size {
                if dictS[s[idx-size]]! > 1 {
                    dictS[s[idx-size]]! -= 1
                } else {
                    dictS[s[idx-size]] = nil
                }
            }
                        
            // 새로운 값 추가
            dictS[s[idx], default: 0] += 1
            
            // 비교해서 같으면 anagram
            if dictS == dictP {
                result.append(idx-size+1)
            }
            
            // 다음 이동
            idx += 1
        }
        
        return result
    }
}
