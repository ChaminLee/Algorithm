// 첫 풀이 - DFS
class Solution1 {
    func validPath(_ n: Int, _ edges: [[Int]], _ start: Int, _ end: Int) -> Bool {
        if n == 1 { return true }
        
        var visited = Array(repeating: false, count: n)
        var path = [Int:[Int]]()
        
        for edge in edges {
            fill(&path, edge[0], edge[1])
            fill(&path, edge[1], edge[0])
        }
        
        var next = [Int]()        
        next.append(start)
        
        while !next.isEmpty {
            let n = next.removeLast()   
            if n == end {
                return true
            }
            
            visited[n] = true
            
            for p in path[n]! {
                if !visited[p] {
                    next.append(p)
                }
            }
        }
                
        return false
    }
    
    func fill(_ path: inout [Int:[Int]], _ s: Int, _ e: Int) {
        if let val = path[s] {
            path[s]!.append(e)
        } else {
            path[s] = [e]
        }
    }
}

// 최적화 - BFS
class Solution2 {
    func validPath(_ n: Int, _ edges: [[Int]], _ start: Int, _ end: Int) -> Bool {
        if n == 1 { return true }
        
        var visited = Array(repeating: false, count: n)
        var path = [Int:[Int]]()
        
        for edge in edges {
            fill(&path, edge[0], edge[1])
            fill(&path, edge[1], edge[0])
        }
        
        var next = [Int]()        
        next.append(start)
        
        while !next.isEmpty {
            let n = next.removeFirst()   
            if n == end {
                return true
            }
            
            visited[n] = true
            
            for p in path[n]! {
                if !visited[p] {
                    next.append(p)
                }
            }
        }
                
        return false
    }
    
    func fill(_ path: inout [Int:[Int]], _ s: Int, _ e: Int) {
        if let val = path[s] {
            path[s]!.append(e)
        } else {
            path[s] = [e]
        }
    }
}

// 더 최적화 - visited를 Set으로 path를 배열로 
class Solution {
    func validPath(_ n: Int, _ edges: [[Int]], _ start: Int, _ end: Int) -> Bool {        
        var visited = Set<Int>()
        var path = [[Int]](repeating: [], count: n)
        
        for edge in edges {
            path[edge[0]].append(edge[1])
            path[edge[1]].append(edge[0])
        }
        
        var next = [Int]()        
        next.append(start)
        
        while !next.isEmpty {
            let n = next.removeFirst()   
            if n == end {
                return true
            }
            
            visited.insert(n)
            
            for p in path[n] {
                if !visited.contains(p) {
                    next.append(p)
                }
            }
        }
                
        return false
    }
}
