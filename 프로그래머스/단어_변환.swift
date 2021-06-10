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
