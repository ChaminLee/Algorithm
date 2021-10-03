// 시간초들을 모두 구해서 오래 걸릶
class Solution {
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        // 독이 있는 시간들을 기록
        var poisoned = Set<Int>()
        
        // 공격 시작점들을 돌며
        for i in 0..<timeSeries.count-1 {
            // 독이 유지되는 시간을 추가
            for t in 0..<duration {
                let p = t + timeSeries[i]
                // 다음 공격 시간보다 커지면 아웃, 작은 경우는 독이 유지되는 시간에 추가
                if p < timeSeries[i+1] {
                    poisoned.insert(p)
                } else {
                    break
                }
            }
        }        
        
        // 마지막 공격 반영
        return poisoned.count + duration
    }
}

// for문 1번만 사용, 굳이 시간초들을 모두 구할 필요 없음
class Solution {
    func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {
        // 총 독 유지 시간, 시작점
        var total = 0
        var start = 0
        
        // 공격 시작점만 돌며
        for t in timeSeries {
            // 독이 끝나는 시간을 계산
            let end = t + duration 
            
            // 끝나는 시간이 이전 시작보다 커야함 
            guard end > start else { continue }
            
            // 이전 공격 이후 독성이 끝난 시간이 start이고, 현재 공격 시작 시점이 t이기에 더 큰 시점을 end에서 빼줘야 한다. 
            // 더 작은 것을 고르게 되면 중복이 되기 때문
            total += end - max(t, start)
            start = end 
        }
        
        return total
    }
}


