class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        // matrix 복사
        var temp = matrix
        // 행
        for i in 1..<matrix.count {
            // 열
            for j in 1..<matrix[0].count {
                // temp 행렬 그림
                // 대각  위
                // 왼쪽  기준
                
                // 왼쪽
                let l = temp[i-1][j]
                // 위
                let u = temp[i][j-1]
                // 대각
                let c = temp[i-1][j-1]
                // 최솟값 구하기
                let minC = min(c,min(l,u))
                // 박스의 최솟값이 0이면 그냥 값 그대로 두기
                if min(temp[i][j], minC) == 0 {
                    continue
                // 최솟값이 0이 아닌 경우    
                } else {
                    // 오른쪽 아래 원소에 최솟값 + 1을 할당한다.
                    // 1 1
                    // 1 1
                    // 위 케이스에 해당하기에 
                    // 1 1
                    // 1 2
                    // 이처럼 변경하여 해당 박스는 2x2도 가능하다는 것을 기입해둔다. 
                    // 이후 돌면서 최솟값이 2가 되면 3개까지 가능하다는 말이다!
                    temp[i][j] = (minC+1)
                }
            }
        }
        return temp.flatMap{$0}.reduce(0,+)
    }
}
