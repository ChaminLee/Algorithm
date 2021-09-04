class Solution {
    func rob(_ nums: [Int]) -> Int {
        guard nums.count > 2 else { return nums.max()! }
        
        var dp = [nums[0], max(nums[0], nums[1])] 
        
        for i in 2..<nums.count {
            // 이전 값 혼자, 현재 + 전전값을 계속 연산해나가면서 축적함
            dp.append(max(dp[i-1], dp[i-2] + nums[i]))
        }
                
        return dp.last!
    }
}
