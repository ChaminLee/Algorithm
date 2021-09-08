import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    // 원 배열 만들기
    var grid = Array(repeating: Array(repeating: 0, count: columns), count: rows)
    var answer = [Int]()
    
    // 원 배열 채우기
    for r in 1..<rows+1 {
        for c in 1..<columns+1 {
            grid[r-1][c-1] = (r-1) * columns + c
        }
    }
    
    // 쿼리 돌며 회전시키고, 최솟값 구해서 append하기
    for q in queries {
        let result = rotate(grid, q)
        let newGrid = result.0
        answer.append(result.1)
        grid = newGrid
    }
    
    return answer
}

// 행렬 회전
func rotate(_ grid: [[Int]], _ points: [Int]) -> ([[Int]], Int) {
    // 우 하 좌 상
    var mat = grid, temp = [Int]()
    let s = (points[0]-1, points[1]-1)
    let e = (points[2]-1, points[3]-1)
    
    // 좌 > 우
    for i in s.1..<e.1 {        
        if i+1 <= e.1 {
            mat[s.0][i+1] = grid[s.0][i]
            temp.append(grid[s.0][i])
        }    
    }
    
    // 상 > 하
    for i in s.0..<e.0 {
        if i+1 <= e.0 {
            mat[i+1][e.1] = grid[i][e.1]
            temp.append(grid[i][e.1])
        }
    }
    
    // 우 > 좌
    for i in stride(from: e.1, through: s.1, by: -1) {
        if i-1 >= s.1 {
            mat[e.0][i-1] = grid[e.0][i]
            temp.append(grid[e.0][i])
        }
    }
    
    // 하 > 상
    for i in stride(from: e.0, through: s.0, by: -1) {
        if i-1 >= s.0 {
            mat[i-1][s.1] = grid[i][s.1]
            temp.append(grid[i][s.1])
        }
    }
    
    return (mat, temp.min()!)
}
