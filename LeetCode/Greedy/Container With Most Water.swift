class Solution {
    func maxArea(_ height: [Int]) -> Int {
        // 인덱스 설정
        var l = 0, r = height.count - 1
        var res = 0
        
        // 만나기 직전까지
        while l < r {
            // 넓이
            let temp = (r - l) * min(height[l],height[r]) 
            
            // 최대인 경우에만 할당
            if res < temp {
                res = temp
            }
            
            // 왼쪽 높이가 더 작다면 왼쪽 인덱스 +- 1 해서 범위를 점점 좁혀나간다. 
            if height[l] < height [r] {
                l += 1
            } else {
                // 반대의 경우 right -= 1을 하여 범위를 좁힌다. 
                r -= 1 
            }
        }
        
        return res
    }
}

// solution 2 (9/9)
class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var left = 0, right = height.count - 1
        var maxSum = 0
        
        // 양 끝부터 비교 
        while left < right {
            // 너비 구하기
            let area = (right - left) * min(height[left], height[right])
            // 기존 값 보다 크다면 갱신
            maxSum = maxSum < area ? area : maxSum
            // 높이가 더 작은 쪽을 이동시켜주기
            height[left] > height[right] ? (right -= 1) : (left += 1)
        }
        
        return maxSum
    }
}
