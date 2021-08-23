// my solution
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        // 빈 배열일 경우 [-1,-1] 반환
        if nums.count == 0 { return [-1,-1] }
        
        // 좌,우 인덱스
        var left = 0
        var right = nums.count - 1
        // 결과 인덱스 배열 
        var result = [Int]()
        
        // binary search
        while left < right {
            let mid = (left + right) / 2
            
            // 타겟과 같을 경우, 
            if nums[mid] == target {  
                result.append(mid)
                // 양 옆의 값 또한 target과 같은지 비교 
                left = mid - 1
                right = mid + 1
                
                // 왼쪽으로 한 칸씩
                while left >= 0 {
                    if nums[left] == target {
                        result.append(left)                        
                    }
                    left -= 1
                }
                
                // 오른쪽으로 한 칸씩
                while right < nums.count {
                    if nums[right] == target {
                        result.append(right)                        
                    }
                    right += 1
                }
                
                // [최소 범위, 최대 범위] 반환
                return [result.min()!,result.max()!]
            // 타겟을 찾기 위해 좌측 인덱스 mid + 1로 이동
            } else if nums[mid] < target {
                left = mid + 1                
            // 타겟을 찾기 위해 우측 인덱스 mid - 1로 이동
            } else {
                right = mid - 1
            }
        }
        
        // left == right인 경우, nums[left]가 target과 같은 경우를 고려
        return nums[left] == target ? [left,left] : [-1, -1]
        
    }
}


// optimized solution 
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        return [findLeft(nums, target), findRight(nums, target)]
    }
    
    // 계속 좌측으로 이동하며 좌측에서 가장 끝단의 target 인덱스를 구함 
    private func findLeft(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1
        var result = -1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] >= target {
                if nums[mid] == target {
                    result = mid
                }
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        return result
    }
    // 계속 우측으로 이동하며 우측에서 가장 끝단의 target 인덱스를 구함 
    private func findRight(_ nums: [Int], _ target: Int) -> Int {
        var left = 0, right = nums.count - 1
        var result = -1
        while left <= right {
            let mid = left + (right - left) / 2
            if nums[mid] <= target {
                if nums[mid] == target {
                    result = mid
                }
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        return result
    }
}
