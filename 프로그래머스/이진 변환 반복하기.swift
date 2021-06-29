import Foundation

func solution(_ s:String) -> [Int] {
    var s = s 
    var ans = [0,0]
    
    // 1일 때 까지 반복
    while s != "1" {
        // 0을 제거하기 전 크기
        var pre = s.count
        // 0 제거
        s = s.replacingOccurrences(of: "0", with: "")
        // 0 제거 이후 크기 
        var next = s.count
        // 현재 길이를 다시 2진법으로 변환
        s = String(next, radix: 2)
        // 제거한 0의 개수만큼 더하기
        ans[1] += pre - next
        // 반복 횟수 추가 
        ans[0] += 1
    }    
    return ans
}
