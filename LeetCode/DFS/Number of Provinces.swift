// dfs - recursive
class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        var graph = isConnected
        var N = graph.count
        var visited = Array(repeating: false, count: N)
 
        func dfs(_ idx: Int, _ visited: inout [Bool]) {
            for i in 0..<N {
                if !visited[i] && i != idx && graph[idx][i] == 1 {
                    visited[i] = true
                    dfs(i, &visited)
                }
            }
        }
        
        var province = 0 
        for i in 0..<N {
            if !visited[i] {
                dfs(i, &visited)    
                province += 1
            }
            
        }
      
        return province
    }
}

// dfs - iterative
class Solution {
    func findCircleNum(_ isConnected: [[Int]]) -> Int {
        var graph = isConnected
        var N = graph.count
        var visited = Array(repeating: false, count: N)
        
        func dfs(_ idx: Int) {
            var next = [Int]()
            next.append(idx)
            visited[idx] = true
            
            while !next.isEmpty {
                let n = next.removeLast()
                
                for i in 0..<N {
                    if i != n && graph[n][i] == 1 && !visited[i] {
                        visited[i] = true
                        next.append(i)
                    }
                }
            }            
        }
       
        var province = 0 
        for i in 0..<N {
            if !visited[i] {
                dfs(i)    
                province += 1
            }            
        }
        
        return province
    }
}
