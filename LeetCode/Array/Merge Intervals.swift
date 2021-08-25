class Solution { 
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        
        // [a,b]중 a를 기준으로 오름차순 정렬
        var nums = intervals.sorted { $0[0] < $1[0] }
        // 이전, 현재를 나타낼 인덱스
        var pre = 0, now = 1
                        
        // 현재 비교하는 인덱스는 전체 배열의 길이보다 작아야 함
        while now < nums.count {
            // 이전 값의 끝 범위와, 현재 값의 시작 범위를 비교. 
            // 현재 값의 시작 범위가 작거나 같다면 범위에 포함되어 이전 값의 범위와 합쳐져야 한다. 
            if nums[pre][1] >= nums[now][0] {    
                // 합칠 때 시작 범위는 이전 값의 시작범위이나, 끝범위는 최대값인지 비교하여 붙여줘야 한다. 
                nums[pre] = [nums[pre][0], max(nums[pre][1], nums[now][1])]
                // 합쳐줬으니 현재 값은 제거
                nums.remove(at: now)
            } else { 
                // 다음으로 이동
                pre = now
                now += 1
            }
            
        }
                        
        return nums
    }
}
