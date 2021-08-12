class Solution {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {        
        var left = 0
        var right = nums.count - 1
        var mid = 0
        
        // 인덱스를 벗어난 숫자일 경우 별도로 처리
        if nums.max()! < target {
            return nums.count
        } else if nums.min()! > target {
            return 0 
        }
        
        // binary search
        while left < right {
            mid = (left + right) / 2
            
            if target == nums[mid] {
                return mid
            } else if target > nums[mid] {                 
                left = mid + 1
            } else {
                right = mid
            }
        }

        return left
    }
}
