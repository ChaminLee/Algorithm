class Solution {
    func numSubarrayProductLessThanK(_ nums: [Int], _ k: Int) -> Int {
        if k == 0 { return 0 }
        var start = 0, sum = 1, res = 0
        
        for i in 0..<nums.count {
            // 곱 계산
            sum *= nums[i]
            
            // 기준보다 작지 않거나, 시작점이 길이보다 작을 때
            while sum >= k && start < nums.count {
                sum /= nums[start]
                start += 1 
            }
            
            // start부터 i까지안에서는 조합해서 모두 가능 
            res += (i - start + 1)
        }
        
        return res
    }
}
