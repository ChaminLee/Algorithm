class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        // last index
        var last = nums.count - 1
        // pre-last index
        var pre = last - 1
        
        // pre가 0보다 크거나 같을 때 
        while pre >= 0 {
            print(pre, last)
            // 현재 인덱스 + 이동 가능한 값 > 다음 위치이어야 이동 가능함
            if pre + nums[pre] >= last {
                // 이전으로 이동
                last = pre
            }
            // 이전으로 이동
            pre -= 1
        }
                
        // 정상적으로 완료되었다면 last가 처음에 위치해야함
        return last == 0
    }
}

