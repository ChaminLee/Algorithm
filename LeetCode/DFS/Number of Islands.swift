class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        // grid 복사
        var grid = grid
        // 방향
        let dir = [0,-1,0,1,0]
        // 행 열
        let M = grid.count, N = grid[0].count
        
        func DFS(_ r: Int, _ c: Int, _ mat: inout [[Character]]) {                        
            // 4방향 체크
            for i in 0..<4 {
                let nr = r + dir[i]
                let nc = c + dir[i+1]
                
                // 범위 안에 드는지, 1이 맞는지
                if nr >= 0 && nr < M && nc >= 0 && nc < N && mat[nr][nc] == "1" {
                    mat[nr][nc] = "0"
                    DFS(nr, nc, &mat)
                }
            }
        }
        
        var cnt = 0 
        
        for i in 0..<M {
            for j in 0..<N {
                if grid[i][j] == "1" {
                    DFS(i, j, &grid)
                    cnt += 1
                }
            }
        }
        return cnt
    }
}
