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
