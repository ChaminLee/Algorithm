class Solution {
    func findPeakElement(_ nums: [Int]) -> Int {
        let mx = nums.max()!
        
        for i in 0..<nums.count {
            if nums[i] == mx {
                return i
            }
        }
        
        return -1
    }
}
