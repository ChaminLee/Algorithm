class Solution {
    func buildArray(_ nums: [Int]) -> [Int] {
        return nums.map { nums[$0] }
    }
}
