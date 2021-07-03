class Solution {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        var res = 0
        // i < j and nums[i] == nums[j]
        for i in 0..<nums.count-1 {
            for j in i+1..<nums.count {
                if nums[i] == nums[j] {
                    res += 1
                }
            }
        }
        return res
    }
}
