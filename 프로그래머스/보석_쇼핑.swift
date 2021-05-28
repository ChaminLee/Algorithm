import Foundation

func solution(_ gems:[String]) -> [Int] {   
    // 나중에 e에 먼저 1을 더해야하기에 여기서 미리 -1 해준 상태로 시작
    var s = 0, e = -1
    // 중복없는 배열의 크기
    let size = Set(gems).count
    // 최대 거리 = 배열의 길이
    var minDist = gems.count
    var answer = [0,0]
    
    // 1일 경우 먼저 예외처리
    if size == 1 { return [1,1] }
    
    // 투 포인터 알고리즘
    var dict = [String:Int]()
    var cnt = 0
    
    while s < gems.count && e < gems.count {
        cnt = dict.count
        
        // 조건(모든 원소 포함?)에 맞는다면 s ++ 
        if (cnt == size) {   
            if abs(e - s) < minDist {
                minDist = abs(e - s)
                // 기존 s,e는 인덱스이기에 +1씩 해줘야한다.
                answer[0] = s + 1
                answer[1] = e + 1
            }
            // dict내 value 값이 0이 되면 key를 삭제해줘야 한다. 
            // 그래야 cnt를 제대로 구할 수 있다. 
            if let v = dict[gems[s]] {
                if v - 1 == 0 {
                    dict.removeValue(forKey: gems[s])
                } else {
                    dict[gems[s]] = v - 1
                }
            }
            s += 1
        // 조건에 맞지 않는다면 e ++
        } else {
            e += 1
            // index에서 벗어나지 않도록 해준다. 
            if e < gems.count {
                // 들어오는 값들 추가 
                if let v = dict[gems[e]] {
                    dict[gems[e]] = v + 1
                } else {
                    dict[gems[e]] = 1
                }
            }
        }
    }
    
    return answer
}