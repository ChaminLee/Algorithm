class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        // 0개일 경우, 0리턴
        if nums.count < 1 { return 0 }
        
        // 중복 제거
        var nums = Set(nums)
        var best = 1
        
        // 배열을 한 번씩 돌며 확인
        for n in nums {
            // n-1이 없다는 것은 자기자신이 출발점이라는 것
            if !nums.contains(n - 1) {
                var temp = 1
                // +1하여 확인 시작
                var next = n + 1
                
                // 다음 값 있는지 확인
                while nums.contains(next) {
                    // 개수 + 1, 값도 다음 값으로!
                    temp += 1
                    next += 1
                }
                best = max(best, temp)
            } 
        }
        
        return best
    }
}
