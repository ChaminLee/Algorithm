import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    // 본인은 항상 가능하기에 1로 초기 세팅
    var answer = 1
    // 배달 가능한 시간인 K가 500,000이하이기에
    let maxNum = 5000001
    
    // 노드 개수만큼, 최댓값으로 초기화 해두고 시작
    var dist : [[Int]] = (0..<N).map { _ in Array(repeating: maxNum, count: N) }
    
    // 본인 -> 본인은 시간 소요 : 0 
    for i in 0..<N {
        dist[i][i] = 0
    }
    
    // 각 노드마다 연결
    for r in road {
        // 출발점
        let s = r[0] - 1
        // 도착점
        let e = r[1] - 1
        // 소요 시간
        let v = r[2]
        
        // 두 지점을 잇는 여러 길이 있을 수 있기에 최소값 저장을 위해 값 비교
        // s,e가 존재한다는 건 갈 수 있다는 것이기에 INF값을 대체해야함
        if dist[s][e] > v || dist[s][e] == maxNum {
            dist[s][e] = v
            dist[e][s] = v
        }
    }
    
    func fw() {
        // k는 거쳐가는 지점
        for k in 0..<N {
            // i는 출발
            for j in 0..<N {
                // j는 도착
                for k in 0..<N {
                    dist[i][j] = min(dist[i][k] + dist[k][j], dist[i][j])
                }
            }
        }
    }
    
    fw()

	// 1번에서 출발이기에 2번 도착 케이스부터 확인 
    for i in 1..<N {
    	// 시간 내일 경우
        if dist[0][i] <= k {
            answer += 1
        }
    }
    return answer
}