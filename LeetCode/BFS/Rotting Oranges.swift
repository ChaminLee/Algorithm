class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        // 방향
        var dir = [[0,1],[0,-1],[1,0],[-1,0]]
        // 행렬 복사
        var mat = grid 
        
        // 행, 영
        let row = mat.count, col = mat[0].count
        
        // rotten인 오렌지 담을 배열
        var rotten = [[Int]]()
        // fresh한 오렌지 개수
        var fresh = 0
        
        // 행렬을 돌며 rotten, fresh 채우기
        for i in 0..<row {
            for j in 0..<col {
                if mat[i][j] == 2 {
                    rotten.append([i,j])
                } else if mat[i][j] == 1 {
                    fresh += 1
                }
            }
        }
        
        // fresh가 하나도 없는 경우 0 리턴
        if fresh == 0 { return 0 }
        
        // 몇 차례에 걸쳐서 rotten되는지 카운트
        var level = 0
        
        // rotten 배열이 모두 사라질 때 까지
        while !rotten.isEmpty {    
            // 담겨있는 rotten은 동시에 rotten 되기에 for문으로 전부 꺼내준다. 
            for _ in 0..<rotten.count {
                let p = rotten.removeFirst()
                
                // 4방향 체크
                for d in dir {
                    let newRow = p[0] + d[0]
                    let newCol = p[1] + d[1]

                    // 인덱싱 가능한지, 해당 값이 fresh한 오렌지인지 확인
                    if (newRow >= 0 && newRow < row) && (newCol >= 0 && newCol < col) && mat[newRow][newCol] == 1 {
                        // rotten 시키기
                        mat[newRow][newCol] = 2
                        // 해당 인덱스 저장
                        rotten.append([newRow, newCol])
                        // fresh한 오렌지 카운트 - 1
                        fresh -= 1                    
                    }
                }
            }            
            // 단계 추가! 
            level += 1
        }
                
        // fresh가 모두 사라졌다면 level - 1 해주기 (마지막으로 rotten된 걸 뽑았을 때도 level이 추가되기 때문)
        // fresh가 아직 남아있다면, rotten 시키지 못한 것이기에 -1 리턴
        return fresh == 0 ? level - 1 : -1
        
    }
}
