// TC 24번 해결중 

import Foundation

func solution(_ board:[[Int]]) -> Int {
    // 방향 설정
    let dir = [[0,-1],[0,1],[1,0],[-1,0]]
    let N = board.count
    // 위치별 비용을 입력할 테이블
    var costTable = Array(repeating: Array(repeating: Int.max, count: N), count: N)
    
    // DFS
    func DFS(_ r: Int, _ c: Int, _ cost: Int, _ direction: Int) {
        // 이동할 곳이 벽이거나 이동한 곳의 비용에 비해 기존 비용이 더 작을 때 패스!
        if board[r][c] == 1 || cost > costTable[r][c] {
            return 
        }
        
        // 이동시 비용 반영, 위 조건에 의해 이미 cost가 더 작은 값임!
        costTable[r][c] = cost
        
        // 4 방향 체크
        for idx in 0..<dir.count {
            // 이동 반영
            let nr = r + dir[idx][0]
            let nc = c + dir[idx][1]
            
            // 이동할 수 있는 범위 내에서만 이동
            if (nr >= 0 && nr < N) && (nc >= 0 && nc < N) {
                // 방향이 같다면 100원만 추가                
                if direction == idx {
                    DFS(nr, nc, cost+100, idx)
                // 방향이 다르다면, 직선+코너(100+500) 600원 추가
                } else {
                    DFS(nr, nc, cost+600, idx)
                }
            }
        }
    }    
    
    // 처음은 비용 0
    costTable[0][0] = 0
    
    // 첫 이동은 우측, 아래만 가능 > 미리 선택
    // 첫 이동 비용 100원 추가
    DFS(0,1,100,1)
    DFS(1,0,100,2)
    
    return costTable[N-1][N-1]
}
