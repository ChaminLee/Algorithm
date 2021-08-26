class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        // 현재 인덱스와 횟수
        var now = 0, cnt = 0
        
        // 총 배열의 인덱스 만큼만
        while cnt < nums.count {
            // 현재 0이라면 
            if nums[now] == 0 {
                // 제거하고 
                nums.remove(at: now)
                // 뒤에 0 붙이고
                nums.append(0)
                // 다시 현재 인덱스로 돌아오기 위해 -1
                now -= 1
            }
            
            // 횟수 및 다음 인덱스로 이동
            cnt += 1
            now += 1
        }
        
    }
}
