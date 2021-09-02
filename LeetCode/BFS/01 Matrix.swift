// BFS 풀이
class Solution2 {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var grid = mat 
        
        // 방향 표현
        let dir = [0,-1,0,1,0]
        // 행 열
        let row = mat.count, col = mat[0].count
        // 0인 지점에서 시작해보기 위해, 0인 인덱스를 저장할 것임
        var points = [[Int]]()
        
        // 0이면 points에, 아니면 -1로 아직 들르지 않았다고 표현
        for i in 0..<row {
            for j in 0..<col {
                if grid[i][j] == 0 {
                    points.append([i,j])
                } else {
                    grid[i][j] = -1
                }
            }
        }
        
        // 0인 배열이 다 사라질 때 까지
        while !points.isEmpty {
            // Queue의 특성
            let p = points.removeFirst()
            
            // 4방향 주변 값 탐색
            for i in 0..<4 {
                let newRow = p[0] + dir[i]
                let newCol = p[1] + dir[i+1]
                
                // 범위 안에 들어야 하고, -1이어야 한다. 즉, 들르지 않은 값이어야 한다. 
                if (newRow >= 0 && newRow < row) && (newCol >= 0 && newCol < col) && grid[newRow][newCol] == -1 {
                    // 기존 값과 거리가 1인 주변부이기 때문에 기존값 + 1을 해준다. 
                    grid[newRow][newCol] = grid[p[0]][p[1]] + 1
                    // 주변 부의 주변을 살피기 위해 새로운 좌표에 추가한다. 
                    points.append([newRow, newCol])
                }
            }
            
        }
                
        return grid
    }
}

// DP 풀이
class Solution {
    func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
        var grid = mat 
        let row = mat.count, col = mat[0].count
        let maxN = row * col
        
        // 0은 취급하지 않음
        // DP는 이전에 연산된 값들을 가지고 연산을 하는데, 현재 4방향이 모두 연산되었다고 보기 힘들다.
        // 그렇기에 두 방햘씩 나눠서 케이스를 봐줄 것이다 (위 > 아래, 왼쪽 > 오른쪽 // 오른쪽 > 왼쪽, 아래 > 위)
        // 위 > 아래, 왼쪽 > 오른쪽의 경우 먼저 계산
        for i in 0..<row {
            for j in 0..<col {
                if grid[i][j] > 0 {
                    var top = maxN, left = maxN
                    
                    if i > 0 {
                        top = grid[i-1][j]
                    }
                    
                    if j > 0 {
                        left = grid[i][j-1]
                    }
                    
                    grid[i][j] = min(top, left) + 1
                }
            }
        }
        
        // 위 > 아래, 왼쪽 > 오른쪽의 경우 먼저 계산
        for i in stride(from: row-1, through: 0, by: -1) {
            for j in stride(from: col-1, through: 0, by: -1) {
                if grid[i][j] > 0 {
                    var bottom = maxN, right = maxN
                    
                    if i < row-1 {
                        bottom = grid[i+1][j]
                    }
                    
                    if j < col-1 {
                        right = grid[i][j+1]
                    }
                    
                    // 기존에 왼 > 오, 위 > 아래로 계산된 grid[i][j]이기에 비교할 값에 껴줘야 한다.
                    grid[i][j] = min(grid[i][j], min(bottom, right)+1)
                }
            }
        }
        
        
        return grid
    }
}

