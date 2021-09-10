class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        // 주어진 배열의 합이 target보다 작다면 답이 나올 수 없음  
        if nums.reduce(0,+) < target { return 0 }
        // 시작점, 합, 길이 
        var start = 0, sum = 0, len = Int.max
        
        // 처음부터 시작
        for i in 0..<nums.count {
            // 값을 총 합에 누적
            sum += nums[i]
            
            // 현재 총 합이 target보다 크거나 같고 start가 전체 배열 길이보자 작을 때
            // 더 짧게 만들 수 있다는 것이기에 start를 줄여줌 (총 합에서 start의 값도 빼줌)
            while sum >= target && start < nums.count {
                len = min(len, i - start + 1)
                sum -= nums[start]
                start += 1
            }
        }
        
        return len
        
    }
}
