class Solution {
    func countNegatives(_ grid: [[Int]]) -> Int {
        var total = 0
        // 행
        for i in 0..<grid.count {
            // 열
            var length = grid[i].count
            // 0보다 작으면 추가
            if grid[i][0] < 0 { total += length ; continue }
            
            // 어디서부터 음수로 시작되는지 알아내기
            // 이진탐색
            var left = 0
            var right = length - 1

            while left <= right {
                let mid = (left + right) / 2
                
                // 중간이 0보다 작으면
                if grid[i][mid] < 0 {
                    // 오른쪽 좌표를 좁혀준다.
                    right = mid - 1
                    if grid[i][right] >= 0 {
                        total += (length - mid)
                        break
                    }
                // 중간이 0보다 크면 왼쪽 좌표를 늘려준다
                } else {
                    left = mid + 1
                }
            }
        }
        
        return total
    }
}
