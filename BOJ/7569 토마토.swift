// Logic
// 1. 상,하,좌,우,위,아래 다 익게 만든다
// 2. 이동 가능한 좌표를 생성한다.
// 3. 입력받을 때 익은 토마토의 좌표를 미리 queue에 담아둔다
// 4. removeFirst는 O(n)이니 인덱스로 접근
// 5. 결과가 0을 포함한다면 실패한 것이니 -1, 최대값이 1이면 처음부터 토마토로 다 차있던 것이기에 1, 시간은 최대 값의 -1(1에서 시작했기 때문)

// Solution
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let col = input[0], row = input[1], height = input[2]
var boxes = [[[Int]]](repeating: [[]], count: height)
var visited = [[[Bool]]](repeating: Array(repeating: Array(repeating: false, count: col), count: row), count: height)
var dx = [0,0,1,-1,0,0]
var dy = [0,0,0,0,1,-1]
var dz = [1,-1,0,0,0,0]
var queue = [(Int,Int,Int)]()

for h in 0..<height {
    var box = [[Int]](repeating: [], count: row)
    for i in 0..<row {
        let tomato = readLine()!.split(separator: " ").map { Int(String($0))! }
        tomato.enumerated().filter { $0.element == 1 }.map { (i, $0.offset, h) }.forEach {
            queue.append($0)
        }
        box[i] = tomato
    }
    boxes[h] = box
}

func bfs() {
    var index = 0
    
    while queue.count > index {
        let next = queue[index]
        
        for i in 0..<dx.count {
            let newX = next.0 + dx[i]
            let newY = next.1 + dy[i]
            let newZ = next.2 + dz[i]
            
            if (newX >= 0 && newX < row) && (newY >= 0 && newY < col) && (newZ >= 0 && newZ < height) && !visited[newZ][newX][newY] {
                if boxes[newZ][newX][newY] == 0 {
                    boxes[newZ][newX][newY] = boxes[next.2][next.0][next.1] + 1
                    queue.append((newX, newY, newZ))
                    visited[newZ][newX][newY] = true
                }
            }
        }
        
        index += 1
    }
}

bfs()
let flatted = boxes.flatMap { $0.flatMap { $0 } }
let result = flatted.contains(0) ? -1 : flatted.max()! - 1
print(result == 1 ? 0 : result)
