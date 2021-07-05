class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        // 결과 배열 
        var result = [Int]()
        // 원소가 0이거나 개수가 0일 경우 빈 배열 리턴
        if matrix.count == 0 || matrix[0].count == 0 { return result }
        
        // 행 시작
        var rowStart = 0 
        // 행 끝
        var rowEnd = matrix.count - 1
        // 열 시작
        var colStart = 0
        // 열 끝
        var colEnd = matrix[0].count - 1
        
        // 끝까지는 찍어야 하니 <=로 구분
        while rowStart <= rowEnd && colStart <= colEnd {
            // 왼쪽 > 오른쪽 이동하는 케이스
            // 행 고정, 열만 이동
            for i in stride(from: colStart, through: colEnd, by: 1) {
                result.append(matrix[rowStart][i])
            }
            // 행에 +1하여 한 칸 내려감
            rowStart += 1
            
            // start > end 면 그냥 지나침 
            // 열을 고정하고 행만 이동 시켜준다. 위 > 아래 
            for i in stride(from: rowStart, through: rowEnd, by: 1) {
                result.append(matrix[i][colEnd])
            }
            // 열에 -1하여 오른쪽 한 칸을 제외시킨다. 
            colEnd -= 1
            
            // 아직 중간에 줄이 더 있거나 딱 마지막일 경우, 
            if rowStart <= rowEnd {
                // 오른쪽 > 왼쪽 
                // 행 고정, 열 이동
                for i in stride(from: colEnd, through: colStart, by: -1) {
                    result.append(matrix[rowEnd][i])
                }
                // 행의 끝에 -1하여 한 칸 올려준다. 
                rowEnd -= 1
            }
            
            // 마찬가지로 아직 중간에 열이 더 남아있거나 딱 마지막인 경우
            if colStart <= colEnd {
                // 아래 > 위
                // 열은 고정, 행만 이동 
                for i in stride(from: rowEnd, through: rowStart, by: -1) {
                    result.append(matrix[i][colStart])
                }
                // 열의 시작에 +1하여 다음 왼쪽 > 오른쪽할 때 한 칸 왼쪽 + 1 > 오른쪽으로 가게 해준다. 
                colStart += 1
            }
        }
        
        return result
    }
}
