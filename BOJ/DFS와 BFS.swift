import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }

let n = input[0], m = input[1], start = input[2]
var edges = [[Int]](repeating: [], count: n)
var bfsVisited = [start]
var dfsVisited = [start]

for _ in 0..<m {
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
    edges[input2[1]-1].append(input2[0])
    edges[input2[0]-1].append(input2[1])
}

edges = edges.map { $0.sorted { $0 < $1 } }

func bfs(_ start: Int) {
    var willVisit = [Int]()
    willVisit.append(start)
    
    while !willVisit.isEmpty {
        let next = willVisit.removeFirst()
        print(next, terminator: " ")
        
        for edge in edges[next-1] {
            if !bfsVisited.contains(edge) {
                bfsVisited.append(edge)
                willVisit.append(edge)
            }
        }
    }
}

func dfs(_ start: Int) {
    print(start, terminator: " ")
    dfsVisited.append(start)
    for edge in edges[start-1] {
        if !dfsVisited.contains(edge) {
            dfs(edge)
        }
    }
}

dfs(start)
print("")
bfs(start)
