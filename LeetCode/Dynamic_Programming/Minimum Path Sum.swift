class Solution {
    func minPathSum(_ grid: [[Int]]) -> Int {        
        var grid = grid
        let row = grid.count, col = grid[0].count
        
        for i in 0..<row {
            for j in 0..<col {
                if i == 0 && j == 0 {
                    continue
                }
                
                // 이전 값 + 현재값으로 현재값을 갱신
                if i == 0 {
                    grid[i][j] += grid[i][j-1]
                } else if j == 0 {
                    grid[i][j] += grid[i-1][j]
                // 최솟값을 구하기 위해 왼쪽, 위 중에 최소인 값을 현재 값에 더해줌
                } else {
                    grid[i][j] += min(grid[i-1][j], grid[i][j-1])
                }
            }
        }
        
        return grid[row-1][col-1]
    }
}
