class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        while nums.contains(val) {
            nums.remove(at: nums.firstIndex(of:val)!)
        }
        
        return nums.count
    }
}

// filter 사용
class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        nums = nums.filter { $0 != val }
        return nums.count
    }
}
