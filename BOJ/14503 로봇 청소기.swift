// Logic
// 1. 현재 칸 칠하기
// 2. 왼쪽부터 보면서, 청소 가능할 경우 dfs 재귀, 불가능할 경우 다음 방햘 확인
// 3. 다 확인했는데 불가한 경우, 후진 가능할 경우 현재 방향 유지하며 후진

// Solution
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }

let row = input[0], col = input[1]
let r = input2[0], c = input2[1]
var dir = input2[2]
// 북 동 남 서 기준으로, 북은 동을 기준으로 왼쪽으로 이동할 좌표를 가짐
let dx = [-1,0,1,0]
let dy = [0,1,0,-1]
var area = [[Int]](repeating: [], count: row)
var cleanCount = 0

for i in 0..<row {
    let input3 = readLine()!.split(separator: " ").map { Int(String($0))! }
    area[i] = input3
}

func rotate() {
    dir = dir-1 < 0 ? 3 : dir-1
}

func dfs(_ start: (Int, Int)) {
    if area[start.0][start.1] == 0 {
        area[start.0][start.1] = 2
        cleanCount += 1
    }
    
    for _ in 0..<4 {
        rotate()
        let newX = start.0 + dx[dir]
        let newY = start.1 + dy[dir]
                            
        if (0..<row).contains(newX) && (0..<col).contains(newY) {
            if area[newX][newY] == 0 {
                dfs((newX, newY))
                return
            }
        }
    }
    
    let backX = start.0 - dx[dir]
    let backY = start.1 - dy[dir]
    
    if (0..<row).contains(backX) && (0..<col).contains(backY) {
        if area[backX][backY] != 1 {
            dfs((backX, backY))
        }
    }
}

dfs((r,c))
print(cleanCount)
