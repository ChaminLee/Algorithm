// Logic
// 1. kruskal 알고리즘 사용 (union-find)
// 2. 우선 간선의 비용을 기준으로 정보들을 오름차순 정렬한다
// 3. cycle이 발생하지 않는 두 노드들에 대해서 비용을 추가해주고, 부모를 합친다

// Solution
import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let node = input[0], edge = input[1]

var infos = [[Int]]()
var cycle = Array<Int>(0..<node)
var minCost = 0

for _ in 0..<edge {
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
    infos.append(input2)
}

func getParent(_ parent: inout [Int], _ node: Int) -> Int {
    if parent[node] != node {
        parent[node] = getParent(&parent, parent[node])
    }
    return parent[node]
}

func unionParent(_ parent: inout [Int], _ nodeA: Int, _ nodeB: Int) {
    let a = getParent(&parent, nodeA)
    let b = getParent(&parent, nodeB)
    
    if a < b {
        parent[b] = a
    } else {
        parent[a] = b
    }
}

func findParent(_ parent: inout [Int], _ nodeA: Int, _ nodeB: Int) -> Bool {
    let a = getParent(&parent, nodeA)
    let b = getParent(&parent, nodeB)
    return a == b
}

infos.sort { $0[2] < $1[2]}

for info in infos {
    let start = info[0] - 1, end = info[1] - 1, cost = info[2]
    
    if !findParent(&cycle, start, end) {
        minCost += cost
        unionParent(&cycle, start, end)
    }
}

print(minCost)
