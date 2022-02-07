import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0], m = input[1]
let directions = [0,-1,0,1,0]
var grid = Array(repeating: Array(repeating: "", count: n), count: m)
var visited = Array(repeating: Array(repeating: false, count: n), count: m)
var myPower = 0, enemyPower = 0

for i in 0..<m {
    let input2 = readLine()!.map { String($0) }
    grid[i] = input2
}

for i in 0..<m {
    for j in 0..<n {
        if !visited[i][j] {
            if grid[i][j] == "W" {
                let num = dfs((i,j), "W")
                myPower += num * num
            } else if grid[i][j] == "B" {
                let num = dfs((i,j), "B")
                enemyPower += num * num
            }
        }
    }
}

print(myPower, enemyPower)

func dfs(_ point: (Int, Int), _ target: String) -> Int {
    var willVisit = [(Int, Int)]()
    var count = 0
    willVisit.append(point)
    
    while !willVisit.isEmpty {
        let next = willVisit.removeLast()
        
        for i in 0..<4 {
            let newX = next.0 + directions[i]
            let newY = next.1 + directions[i+1]
            
            if (newX >= 0 && newX < m) && (newY >= 0 && newY < n) && !visited[newX][newY]  {
                if grid[newX][newY] == target {
                    visited[newX][newY] = true
                    willVisit.append((newX, newY))
                    count += 1
                }
            }
        }
    }
    
    return count == 0 ? 1 : count
}
