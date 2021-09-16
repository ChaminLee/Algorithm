class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        // size of grid
        let N = grid.count
        // if grid's start/end point is 1, it is impossible
        if grid[0][0] == 1 || grid[N-1][N-1] == 1 { return -1 }
        // grid, result, next array
        var grid = grid, res = 1, next = [(Int,Int)]()
        // 8-direction
        var dir = [(-1,-1),(-1,0),(-1,1),(0,-1),(0,1),(1,-1),(1,0),(1,1)]
        
        // set start point and make start point visited
        grid[0][0] = 1
        next.append((0,0))
        
        // until next is empty
        while !next.isEmpty {
            // temp array
            var temp = [(Int,Int)]()
            // BFS 
            for n in next {    
                // if current point is same as end point, then return
                if n.0 == N-1 && n.1 == N-1 { return res }
                
                // origin + new direction
                for i in 0..<dir.count {
                    let nr = n.0 + dir[i].0
                    let nc = n.1 + dir[i].1
                    
                    if nr >= 0 && nr < N && nc >= 0 && nc < N && grid[nr][nc] == 0 {
                        // visit
                        grid[nr][nc] = 1
                        // add new point
                        temp.append((nr,nc))
                    }
                }                
            }     
            // move to next points 
            next = temp
            // count + 1
            res += 1
        }
        
        return -1        
    }
}
