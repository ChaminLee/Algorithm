// 1
import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var visited = Array(repeating: false, count: words.count)
    var ans = Int.max
    
    func DFS(_ start: String, _ cnt: Int) {
        if start == target {
            ans = min(ans,cnt)
            return 
        }
        
        for i in 0..<words.count {
            if !visited[i] && zip(start, words[i]).filter {$0 != $1}.count == 1 {
                visited[i] = true
                DFS(words[i], cnt + 1)
                visited[i] = false
            }
        }
    }
    
    DFS(begin,0)
    return ans == Int.max ? 0 : ans
}


// 2 
import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    // 원소 방문 여부를 체크해 줄 배열 
    var visited = Array(repeating: false, count: words.count)
    // 최종 step 수 (아무리 커도 배열의 크기를 넘을 순 없음)
    var step = Int.max
    
    func DFS(_ start: String, _ depth: Int) {
        // 1. 종료 조건 (현재 원소가 목표 원소일 경우)
        if start == target {
            // 현재 경로와 이전 경로 중 최솟값을 저장
            print(visited)
            step = min(step, depth)
            return 
        }
        
        // 2. 매 원소를 돌며 다음에 올 수를 찾음
        for i in 0..<words.count {
            // 조건 (방문하지 않았고, 1개 문자만 차이나야 함)
            if !visited[i] && diff(start,words[i]) == 1 {
                // 방문 체크 
                visited[i] = true
                // 다음 원소 이동, depth + 1
                DFS(words[i],depth + 1)
                // 탐색 끝: 재귀 종료 후 가장 마지막 원소 방문기록 되돌리기             
                visited[i] = false                
            }     
        }        
    }
    DFS(begin,0)
    return step == Int.max ? 0 : step
}

func diff(_ o1: String, _ o2: String) -> Int {
    // 총 길이
    var count = o1.count
    for (n,m) in zip(o1,o2) {
        // 같으면 -1
        // count에 남는 수 만큼 문자가 다른 것이다. 
        if n == m {
            count -= 1
        }
    }    
    return count 
}
