// Logic
// 1. 이모지의 개수와 클립보드의 개수에 따라 경우의 수가 나뉘기에 방문 배열도 나눠줌
// 2. 클립보드 복사, 이모지 -1 경우, 복붙 경우를 조건에 따라 구현
// 3. 복사할 때는 emojicount만 사용, 클립보드에 emojicount 복사
// 4. 뺄 때는 emojicount - 1
// 5. 복붙할 때는 emojicount + clipboard로 구현 ,클립보드는 0보다 커야하고, 둘의 합은 최대 1000 이하여야 한다. (이모지의 최대값은 1000이기 때문!)

// Solution
import Foundation

let target = Int(readLine()!)!
var visited = Array(repeating: Array(repeating: false, count: 1001), count: 1001)
var time = 0

func bfs() {
    var willVisit = [(emojiCount: 1, clipboard: 0, time: 0)]
    
    while !willVisit.isEmpty {
        let now = willVisit.removeFirst()
        
        if now.emojiCount == target {
            time = now.time
            return
        }
        
        // 클립보드 복사
        if !visited[now.emojiCount][now.emojiCount] {
            visited[now.emojiCount][now.emojiCount] = true
            willVisit.append((now.emojiCount, now.emojiCount, now.time + 1))
        }
        
        // 현재 이모지 - 1
        if now.emojiCount > 0 && now.emojiCount < 1001 {
            if !visited[now.emojiCount - 1][now.clipboard] {
                visited[now.emojiCount - 1][now.clipboard] = true
                willVisit.append((now.emojiCount - 1, now.clipboard, now.time + 1))
            }
        }
        
        // 클립보드에서 복붙
        if now.clipboard > 0 && now.emojiCount + now.clipboard < 1001 {
            if !visited[now.emojiCount + now.clipboard][now.clipboard] {
                visited[now.emojiCount + now.clipboard][now.clipboard] = true
                willVisit.append((now.emojiCount + now.clipboard, now.clipboard, now.time + 1))
            }
        }
    }
}

bfs()
print(time)
