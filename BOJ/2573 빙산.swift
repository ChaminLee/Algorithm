// MARK: - 빙산
// Logic
// 1. 빙산을 기준으로 시작해서 BFS로 찾아지는 0의 개수만큼 본인 녹이기
// 2. 두 덩이인지 확인하는 로직 확인
// 3. 두 덩이면 시간 출력, 다 녹아서 0이 되면 0 출력

// Solution
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let row = input[0], col = input[1]
let dir = [0,-1,0,1,0]
var ice = [[Int]](repeating: [], count: row)

for i in 0..<row {
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
    ice[i] = input2
}

func melt(_ start: (Int, Int), _ visited: inout [[Bool]]) {
    var willVisit = [start]
    
    while !willVisit.isEmpty {
        let next = willVisit.removeFirst()
        
        for i in 0..<4 {
            let newX = next.0 + dir[i]
            let newY = next.1 + dir[i+1]
            
            if (newX >= 0 && newX < row) && (newY >= 0 && newY < col) && !visited[newX][newY] {
                if ice[newX][newY] > 0 {
                    willVisit.append((newX, newY))
                    visited[newX][newY] = true
                } else {
                    if ice[next.0][next.1] > 0 {
                        ice[next.0][next.1] -= 1
                    }
                }
            }
        }
    }
}

var time = 0
var flag = false
while ice.flatMap { $0 }.reduce(0,+) > 0 {
    var group = 0
    var visited = Array(repeating: Array(repeating: false, count: col), count: row)

    for i in 0..<row {
        for j in 0..<col {
            if ice[i][j] > 0 && !visited[i][j] {
                visited[i][j] = true
                melt((i,j), &visited)
                group += 1
            }
        }
    }
    
    if group > 1 {
        flag = true
        break
    }
    time += 1
}

let result = flag ? time : 0
print(result)
