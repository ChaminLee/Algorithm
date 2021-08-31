class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {        
        
        // 방향
        let dir = [[0,-1],[0,1],[1,0],[-1,0]]
        
        // 행 열
        let row = grid.count
        let col = grid[0].count
        
        // 지나친 좌표들 저장
        var points = [[Int]]()        
        
        // 방문 여부
        var visited = Array(repeating: Array(repeating: false, count: col), count: row)
        // DFS
        func DFS(_ point: [Int], _ result: inout [[Int]]) {
            var nextVisit = [[Int]]()            
            nextVisit.append(point)
                        
            while !nextVisit.isEmpty {
                let p = nextVisit.removeLast()
                
                for d in dir {
                    let newX = p[0] + d[0]
                    let newY = p[1] + d[1]
                    
                    if (newX >= 0 && newX < row) && (newY >= 0 && newY < col) && grid[newX][newY] == 1 && !visited[newX][newY] {
                        nextVisit.append([newX, newY])
                        visited[newX][newY] = true
                        result.append([newX, newY])
                    }
                }
            }
        }
        
        // points의 이전 개수 
        var pre = 0
        // 현재까지 최대 영역의 크기를 저장할 변수
        var area = 0
        
        for i in 0..<row {
            for j in 0..<col {                
                // 1인 경우
                if grid[i][j] == 1 { 
                    // 주변 탐색
                    DFS([i,j], &points)   
                    // 본인이 없을 경우 추가
                    if !points.contains([i,j]) {
                        points.append([i,j])
                    }
                    
                    // 이전과 현재 비교하여 영역의 최대 크기 저장
                    area = max(points.count - pre, area)
                    pre = points.count
                }
            }
        }
                        
        return area
    }
}
