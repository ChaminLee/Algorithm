import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    // 부모 정보 
    var parent = Array(0..<n)
    // 비용 오름차순 정렬
    var costs = costs.sorted { $0[2] < $1[2] }
    // 간선 수 , 총 비용
    var edges = 0, totalCost = 0
    for i in 0..<costs.count {
        // 간선의 수 = 정점 - 1 일때 가능함
        if edges == n - 1 {
            break
        } 
        // 부모가 다를 경우
        if find(&parent, costs[i][0]) != find(&parent, costs[i][1]) {
            // 순환그래프가 아니게 됨
            edges += 1
            totalCost += costs[i][2]
            // 최상위 부모로 합치기
            union(&parent, costs[i][0], costs[i][1]) 
        }
    }

    return totalCost
}

// Find
func find(_ parent: inout [Int], _ idx: Int ) -> Int {
    // 본인이 아니면 최상위 부모를 찾음
    if parent[idx] != idx {
        parent[idx] = find(&parent, parent[idx])        
    }
    
    return parent[idx]
}

// Union
func union(_ parent: inout [Int], _ a: Int, _ b: Int) {
    let parA = find(&parent,a)
    let parB = find(&parent,b)
    
    // 상위 부모로 할당
    if parA < parB {
        parent[parB] = parent[parA]
    } else {
        parent[parA] = parent[parB]
    }
}
