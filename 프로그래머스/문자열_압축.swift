import Foundation

func solution(_ s:String) -> Int {
    // 문자의 최대 길이
    var result = 1000
    // 반으로 접는게 최대 축약
    var len = s.count / 2
    
    // 길이가 1일 경우 그냥 그대로 1 반환
    if s.count == 1 { return 1 }
    
    // 1개씩 묶는거부터 len개씩 묶는거까지
    for idx in 1...len {
        // string내 elements를 삭제할거라 변수 선언
        var s = s
        // 현재 묶음
        var cur = ""
        // 최종 묶음
        var res = ""
        // 현재 묶음의 등장 횟수
        var cnt = 1
        
        // idx개씩 묶으려는데, idx가 s.count(현재 원소)보다 크면 못묶음
        // > 나머지는 그냥 붙어야 함. 
        while s.count >= idx {
            // 묶음 범위 생성
            let range = s.startIndex..<s.index(s.startIndex, offsetBy: idx) 
            // 묶음
            var v = s[range]
            
            // 초기세팅
            if cur == "" {
                cur = String(v)
            // 같을 경우 cnt += 1
            } else if cur == String(v) {
                cnt += 1      
            // 다를 경우, 결과에 "추가하는 시점"
            } else { 
                if cnt == 1 {
                    res.append("\(cur)")
                } else { 
                    res.append("\(cnt)\(cur)")
                }
                // 현재값 & cnt 교체 
                cur = String(v)
                cnt = 1
            }
            // 현재 묶음 버리기 
            s.removeFirst(idx)
        }
        // 남은 cur과 s를 처리해준다. 
        // 1일 경우 중복없는 하나의 묶음으로서 남은 것 
        if cnt == 1 {
            res.append("\(cur)\(s)")
        // cnt가 1이 아닐 경우 중복된 묶음 + 나머지 값
        } else { 
            res.append("\(cnt)\(cur)\(s)")
        }
        
        // 결과 중 길이가 가장 짧은 값을 저장해두고 있어야 함
        if res.count < result { result = res.count}
    }
    return result
}
