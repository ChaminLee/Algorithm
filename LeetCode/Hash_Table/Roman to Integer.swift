// 1번째 풀이
class Solution {
    func romanToInt(_ s: String) -> Int {
        let roma = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        var ans = 0, idx = 1
        var s = s.map { String($0) }
        
        while idx <= s.count {
            print("A")
            if idx-1 == s.count-1 {
                ans += roma[s[idx-1]]!
            } else {
                switch s[idx-1] {
                case "I":
                    if ["V","X"].contains(s[idx]) {
                        ans += roma[s[idx]]! - 1
                        idx += 1
                    } else {
                        ans += 1
                    }

                case "X":
                    if ["L","C"].contains(s[idx]) {
                        ans += roma[s[idx]]! - 10
                        idx += 1
                    } else {
                        ans += 10
                    }

                case "C":
                    if ["D","M"].contains(s[idx]) {
                        ans += roma[s[idx]]! - 100
                        idx += 1
                    } else {
                        ans += 100
                    }
                default:
                    ans += roma[s[idx-1]]!
                }
            }
            
            idx += 1
        }
        
        
        return ans
    }
}

// 2번째 풀이

class Solution {
    func romanToInt(_ s: String) -> Int {
        let roma = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        var s = s.map { String($0) }
        var ans = 0, pre = 0
        
        s.forEach({
            // 현재 값
            let val = roma[$0] ?? 0
            
            // 현재 값 > 이전 값일 경우 현재 값을 빼준다. 
            if val > pre {
                ans -= pre
            // 현재값 <= 이전 값일 경우 이전 값을 더해준다.
            } else {
                ans += pre
            }
            // 이전 값 갱신
            pre = val
        })
        
        // 이후 마지막 값 더해주기
        ans += pre
        
        return ans
    }
}
