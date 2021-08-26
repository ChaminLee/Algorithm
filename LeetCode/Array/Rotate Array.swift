// insert + remove
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        var times = 1
        
        let k = k % nums.count 

        while times <= k {
            var last = nums.removeLast()
            nums.insert(last, at: 0)
            times += 1
        } 
    }
}

// indexing
class Solution {
    func rotate(_ nums: inout [Int], _ k: Int) {
        if k == 0 {
            return 
        }
        
        let k = k % nums.count 
        
        nums = Array(nums[nums.count-k..<nums.count] + nums[0..<nums.count-k])
    }
}
