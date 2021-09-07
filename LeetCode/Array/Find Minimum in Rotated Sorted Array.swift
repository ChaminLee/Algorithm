class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var idx = 0, p = 0
        var result = [Int]()
        
        // 작아지는 순간 저장
        while idx < nums.count - 1 {
            if nums[idx+1] < nums[idx] {
                p = idx + 1
                break
            }
            idx += 1
        }
        
        // 작아지는 지점을 기점으로 나누기 
        result = Array(nums[p..<nums.count] + nums[0..<p])
        
        // 오름차순 정렬된 배열의 첫 번째 값
        return result[0]
    }
}
