// Logic
// 1. bfs로 최대 크기 찾기

// Solution
import Foundation

var input = readLine()!.split(separator: " ").map { Int(String($0))! }

var row = input[0], col = input[1]
let dir = [0, -1, 0, 1, 0]
var arr = Array(repeating: Array(repeating: 0, count: col), count: row)
var visited = Array(repeating: Array(repeating: false, count: col), count: row)
var maxSize = 0

for _ in 0..<input[2] {
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    arr[input2[0]-1][input2[1]-1] = 1
}

func bfs(_ start: (Int, Int)) -> Int {
    var willVisit = [start]
    var size = 1
    
    while !willVisit.isEmpty {
        let next = willVisit.removeFirst()
        
        for i in 0..<4 {
            let newX = next.0 + dir[i]
            let newY = next.1 + dir[i+1]
            
            if (0..<row).contains(newX) && (0..<col).contains(newY) && arr[newX][newY] == 1 {
                if !visited[newX][newY] {
                    willVisit.append((newX, newY))
                    visited[newX][newY] = true
                    size += 1
                }
            }
        }
    }
    
    return size
}

for i in 0..<row {
    for j in 0..<col {
        if !visited[i][j] && arr[i][j] == 1 {
            visited[i][j] = true
            maxSize = max(maxSize, bfs((i,j)))
        }
    }
}

print(maxSize)
