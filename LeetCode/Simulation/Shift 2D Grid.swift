// 첫 풀이
class Solution2 {
    func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        var row = grid.count, col = grid[0].count 
        var grid = grid 
        let last = grid[row-1][col-1]
        var times = 0 
        
        while times < k {
            for i in 0..<row {
                if i == row - 1 {
                    grid[0] = [grid[i].removeLast()] + grid[0]
                } else {
                    grid[i+1] = [grid[i].removeLast()] + grid[i+1]    
                }            
            }
            times += 1
        }
        
                
        return grid
    }
}

// 몫과 나머지를 이용한 풀이 
class Solution {
    func shiftGrid(_ grid: [[Int]], _ k: Int) -> [[Int]] {
        var row = grid.count, col = grid[0].count, size = row * col 
        var newGrid = [[Int]]()
        // 실행 횟수 감안하고 시작
        var start = size - (k % (size))
        
        // 시작부터 전체 배열개수 만큼 돌아줌
        for i in start..<start+size {
            // 8 0 1 2 3 4 5 6 7 처럼 마지막 원소를 먼저 다루기 위해 나머지 활용
            let n = i % size 
            let r = n / col
            let c = n % col
            
            // 새로운 행 시작을 위해 추가 (col로 나눴을 때 0이면 새로운 행을 이동할 시기)
            if (i - start) % col == 0 {
                newGrid.append([])
            }
            
            // 행에 맞게 추가 
            newGrid[newGrid.count - 1].append(grid[r][c])
        }
        
        return newGrid
    }
}
