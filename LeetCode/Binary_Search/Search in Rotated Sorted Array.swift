class Solution {
    func search(_ nums: [Int], _ target: Int) -> Int {
        // 배열이 0개면 
        if nums.count == 0 { return -1 }
        
        var left = 0
        var right = nums.count - 1
        
        // binary search
        while left < right {
            let mid = (left + right) / 2
            
            // target과 같으면 리턴
            if nums[mid] == target {
                return mid 
            // 좌측 값이 중앙값보다 작거나 같다면, 좌측의 정렬 배열 선택 
            } else if nums[left] <= nums[mid] {
                // target이 범위 안에 있는지 
                if nums[left] <= target && target < nums[mid] {
                    // 있다면 좁혀나가기
                    right = mid - 1
                // 없다면 우측의 정렬된 배열 선택
                } else {
                    left = mid + 1
                }
            // 좌측 값이 중앙값보다 크다면 등 다른 경우
            } else {
                // target이 우측 배열 범위 안에 있는지 
                if target > nums[mid] && target <= nums[right] {
                    // 있다면 범위를 좁혀나가기
                    left = mid + 1
                } else {
                    // 없다면 좌측 배열로 이동
                    right = mid - 1
                }
            }
        }
        // left 인덱스의 값이 target과 같다면 left, 아니라면 -1        
        return nums[left] == target ? left : -1
    }
}
