import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    
    // graph 만들기 
    var graphs = [Int:[Int]]()
    
    for (i,computer) in computers.enumerated() {
        for (j,cpu) in computer.enumerated() {
            if cpu == 1 && i != j {
                if let _ = graphs[i+1] {
                    graphs[i+1]!.append(j+1)
                } else {
                    graphs[i+1] = [j+1]
                }
            }
        }
    }

    // 독립적인 네트워크 망의 개수를 세는 과정
    var visitedNodes = Array(repeating: false, count : n)
    var cnt = 0
    for i in 1...n {
        if !visitedNodes[i-1] {
            visitedNodes[i-1] = true
            cnt += 1
            let indices = DFS(graphs,i)
            for idx in indices {
                visitedNodes[idx-1] = true    
            }
        } 
    }
    
    return cnt
}

// DFS
func DFS(_ graph: [Int:[Int]], _ start: Int) -> [Int] {
    var visited = [Int]()
    var nextNodes = [Int]()
    nextNodes.append(start)
    
    while !nextNodes.isEmpty {
        let next = nextNodes.removeLast() 
        if !visited.contains(next) {
            visited.append(next)
            if let value = graph[next] {
                nextNodes.append(contentsOf: value)
            } else {
                break
            }
        }
    }
    return visited
}