class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        // 행 열
        let row = obstacleGrid.count, col = obstacleGrid[0].count        
        var grid = obstacleGrid
        
        // 시작 지점에 장애물이 있을 경우, 
        if grid[0][0] == 1 {
            return 0
        }
        
        // 시작점부터 1을 세어준다. 
        grid[0][0] = 1
        
        // 행렬을 돌면서 확인
        for i in 0..<row {
            for j in 0..<col {
                // 0,0은 앞에서 처리해줬으니 패스!
                if i == 0 && j == 0 {
                    continue
                }
                
                // 장애물은 0으로 처리!
                if grid[i][j] == 1 {
                    grid[i][j] = 0
                } else {
                    // 0행인 경우, 0행의 이전 값을 가져온다. > [0][1] == [0][0]
                    if i == 0 {
                        grid[i][j] = grid[i][j-1]
                    // 0열인 경우, 0열의 이전 값을 가져온다. > [1][0] == [0][0]
                    } else if j == 0 {
                        grid[i][j] = grid[i-1][j]
                    // 행과 열이 모두 1 이상인 경우, 위 + 왼쪽 값을 더해서 현재값 연산
                    } else {
                         grid[i][j] = grid[i-1][j] + grid[i][j-1]
                    }
                }                
            }
        }
                
        return grid.last!.last!
        
    }
}
