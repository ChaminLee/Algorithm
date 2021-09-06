class Solution {
    func findDuplicate(_ nums: [Int]) -> Int {
        var nums = nums
        var temp = 0 
        
        for num in nums {
            // 이미 0이라면 두 개 있는 것
            if nums[num-1] == 0 {
                // 본인을 리턴
                temp = num
            // 자기 자신을 0으롤 만듬 
            // 다음 번에 0을 지목하는 것은 2개 있다는 의미
            } else {
                nums[num-1] = 0
            }
        }
        return temp
    }
}
