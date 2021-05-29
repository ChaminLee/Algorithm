import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    // 2일 경우 무조건 1개
    if n == 2 { return 1 }
    
    // 빈 연결리스트 생성
    var nodes = [Int:[Int]]()
    // 방문 여부 기록 (F:미방문, T:방문)
    var visited = Array(repeating: false, count:n)
    
    // 주어진 정보로 graph 만들기 
    func connect(key:Int, element:Int) {
        if nodes.keys.contains(key) {
            nodes[key]?.append(element)
        } else {
            nodes[key] = [element]
        }
    }
    
    for e in edge {
        // 양방향이기에 0,1 / 1,0 모두 진행
        connect(key:e[0], element: e[1])
        connect(key:e[1], element: e[0])
    }
    // (노드,거리) 기록 
    // queue : FIFO 형태로 인접한 노드를 방문할 수 있도록 해준다.
    // result : (노드,거리)를 계속 누적해가며 경우의 수를 모두 저장한다.
    var queue = [(Int,Int)]()
    var result = [(Int,Int)]()
    
    // key : 현재 방문 지점 
    // nodes[key]! : 인접 지점 리스트 
    // depth : 출발점과의 거리 
    func bfs(key: Int, depth: Int) {
        for node in nodes[key]! {
            // 들렸던 곳은 패스 
            if visited[node-1] {
                continue
            }
            // 안들린 곳만 진행             
            // 방문 기록 남기기
            visited[node-1] = true
            // 인접점 이동을 위해, 결과값 저장을 위해 append
            queue.append((node,depth))
            result.append((node,depth))
        }
    }
    
    // 초기화 : 1에서 출발하기 때문
    queue.append((1,0))
    visited[0] = true
    
    // FIFO (First-In-First-Out)
    while !queue.isEmpty {
        let point = queue.removeFirst()
        // 인접점으로 이동할 수록 거리는 1씩 추가 
        bfs(key: point.0, depth: point.1+1)
    }
    // 결과값 내 최대 거리를 저장 
    let maxNum = result.map {$1}.max()!
    // "최대 거리 = 결과값 내의 거리"인 지점들을 세준다.
    return result.filter {$0.1 == maxNum}.count
}