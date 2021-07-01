import Foundation

func solution(_ n:Int, _ times:[Int]) -> Int64 {
    // 이분탐색
    // 최대 시간은 최댓값 * 인원수
    var left = 1, right = times.max()! * n
    var count = 0
    
    while left <= right {
        var temp = 0
        let mid = (left + right) / 2

        for time in times {
            temp += mid / time
        }
        
        if temp < n {
            left = mid + 1
        } else {
            right = mid - 1
            count = mid
            
        }
        
    }
    
    return Int64(count)
}
