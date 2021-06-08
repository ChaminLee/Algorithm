import Foundation

func solution(_ n:Int, _ results:[[Int]]) -> Int {
    // n개의 0을 원소로 가지는 배열을 n개 만들어둔다. 각 원소 간의 관계를 표현하기 위함.  
    // 이후 [i][j]가 1인 경우는 i가 j를 이긴다는 것이고, 질 경우 -1로 표기한다.   
    var graphs = Array(repeating: Array(repeating: 0, count: n), count: n)

    // 승, 패 결과를 반영한다. 이기면 1, 지면 -1
    for result in results {
        let win = result[0] - 1
        let lose = result[1] - 1
        
        // 이기는 관계는 반대로 봤을 때 지는 관계이기도 하기에 인덱스를 바꿔서도 처리해준다. 
        graphs[win][lose] = 1
        graphs[lose][win] = -1
    }

    // 각 원소들을 기준으로 봐준다.
    for i in 0..<n {
        // DFS를 통해 i를 기준으로 항상 승리하는 원소들을 얻을 수 있다.  
        // i를 기준으로 해당 원소의 위치에 승/패 여부를 기입해준다. 
        for j in DFS(graphs,i) {
            graphs[i][j] = 1
            graphs[j][i] = -1
        }
    }
    
    // 온전히 순위를 구할 수 있는 원소의 수를 세어주기 위한 result
    var result = 0
    // graphs의 원소들 중 0을 1개만 가지는 경우가 조건에 충족하기에 count 해준다.
    for graph in graphs {
        if graph.filter { $0 == 0 }.count == 1 {
            result += 1
        }
    }
    return result
}

func DFS(_ graph: [[Int]], _ start: Int) -> [Int] {
    // 항상 이기는 상대를 저장하기 위함
    var visited = [Int]()
    // 내가 이기는 원소를 저장함 > 반복되며 이긴 원소가 이기는 다른 원소들의 관계까지 반영
    var willVisit = [Int]()
    willVisit.append(start)

    while !willVisit.isEmpty {
        let next = willVisit.removeLast()
        if !visited.contains(next) {
            visited.append(next)
            // 이기는 원소만 willVisit에 저장한다. 
            for (i,v) in graph[next].enumerated() {
                if v == 1 {
                    willVisit.append(i)
                }     
            }            
        }
    }
    // 자기 자신이 들어가 있기 때문에 제거해준다. 
    visited.removeFirst()
    return visited
}
