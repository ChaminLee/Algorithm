// solution 1 
import Foundation

func solution(_ n:Int) -> Int {
    // return n.nonzeroBitCount
    var ans = 0 
    var n = n 
    
    // 0보다 클 때 까지 
    while n > 0 {
        // 홀수인 경우 점프로 갈 수 없음 
        if n % 2 != 0 {
            // 점프 가능하게 짝수로 만들어주고
            n -= 1
            // 1회 추가
            ans += 1
        // 점프 시 절반으로 줄이기
        } else {
            n /= 2
        }
    }
    
    return ans
}

// solution 2
func solution(_ n:Int) -> Int {
    // 점프로 가지 못하는 구간이 1의 위치와 동일
    return n.nonzeroBitCount
}
