class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var check = Array(repeating: 0, count: nums.count)
        var result = [Int]()
        
        // index로 도는게, 값으로 도는 것 보다 훨씬 빠름 
        // 등장한 숫자는 1씩 증가
        for i in 0..<nums.count {
            check[nums[i] - 1] += 1
        }
        
        // 등장하지 않은 값들을 추가 
        for i in 0..<check.count {
            if check[i] == 0 {
                result.append(i+1)
            }
        }
        
        return result
    }
}
