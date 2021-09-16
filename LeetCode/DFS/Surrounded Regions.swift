// 첫 풀이
class Solution {
    func solve(_ board: inout [[Character]]) {
        // 테두리가 O일 때, 이와 연결된 O는 뒤집지 않아도 됨 
        // DFS
        let row = board.count, col = board[0].count
        // 방향
        let dir = [0,-1,0,1,0]
        
        func dfs(_ start: (Int,Int)) {
            for i in 0..<4 {
                let nr = start.0 + dir[i]
                let nc = start.1 + dir[i+1]
                
                if nr >= 0 && nr < row && nc >= 0 && nc < col  && board[nr][nc] == "O" {
                    board[nr][nc] = "A"
                    dfs((nr,nc))
                }
            }
        }
        
        // 테두리와 연결된 부분 확인
        for i in 0..<row {
            for j in 0..<col {
                if (i == 0 || i == row-1 || j == 0 || j == col-1) && board[i][j] == "O" {
                    dfs((i,j))
                }
            }
        }
        
        // 변경 후 값들 확인 
        for i in 0..<row {
            for j in 0..<col {
                if (i != 0 && i != row-1 && j != 0 && j != col-1) && board[i][j] == "O" {
                    board[i][j] = "X"
                } else if board[i][j] == "A" {
                    board[i][j] = "O"
                }
            }
        }
        
    }    
}

// 최적화 풀이 - check 배열, dir 사용 X 
class Solution {
    func solve(_ board: inout [[Character]]) {
        // 행 열 
        let row = board.count, col = board[0].count
        // DFS        
        func dfs(_ r: Int, _ c: Int) {            
            if r >= 0 && r < row && c >= 0 && c < col  && board[r][c] == "O" {
                board[r][c] = "A"
                
                dfs(r-1,c)
                dfs(r+1,c)
                dfs(r,c-1)
                dfs(r,c+1)
            }
        }
        
        // 테두리와 연결된 부분 값 바꿔주기
        for i in 0..<row {
            for j in 0..<col {
                if (i == 0 || i == row-1 || j == 0 || j == col-1) && board[i][j] == "O" {
                    dfs(i,j)
                }
            }
        }
        
        // 바뀐 값들 원래대로, 안바뀐 값들 뒤집기
        for i in 0..<row {
            for j in 0..<col {
                if board[i][j] == "O" {
                    board[i][j] = "X"
                } else if board[i][j] == "A" {
                    board[i][j] = "O"
                }
            }
        }
        
    }    
}

