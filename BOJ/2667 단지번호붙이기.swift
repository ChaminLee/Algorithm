// Logic
// 1. 1로 이루어진 영역의 개수 찾기
// 2. 1로 이루어진 영역들의 각 개수를 배열에 담아서 오름차순 정렬
// 3. 2번의 결과를 한 줄 씩 출력

// Solution
import Foundation

let n = Int(readLine()!)!
let dirs = [0, -1, 0, 1, 0]
var apartments = [[Int]](repeating: [], count: n)
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var blocks = 0
var countsOfBlocks = [Int]()

for i in 0..<n {
    let input2 = readLine()!.map { Int(String($0))! }
    apartments[i] = input2
}

func bfs(_ start: (Int, Int)) {
    var willVisit = [start]
    var count = 1
    
    while !willVisit.isEmpty {
        let next = willVisit.removeFirst()
        
        for i in 0..<4 {
            let newX = next.0 + dirs[i]
            let newY = next.1 + dirs[i+1]
            
            if (newX >= 0 && newX < n) && (newY >= 0 && newY < n) {
                if !visited[newX][newY] && apartments[newX][newY] == 1 {
                    visited[newX][newY] = true
                    willVisit.append((newX, newY))
                    count += 1
                }
            }
        }
    }
    countsOfBlocks.append(count)
}

for i in 0..<n {
    for j in 0..<n {
        if apartments[i][j] == 1 && !visited[i][j] {
            visited[i][j] = true
            bfs((i,j))
            blocks += 1
        }
    }
}

print(blocks)
countsOfBlocks.sorted { $0 < $1 }.forEach {
    print($0)
}
