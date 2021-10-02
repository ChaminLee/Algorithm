// 첫 풀이
class Solution2 {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        let row = matrix.count, col = matrix[0].count
        var newMatrix = [[Int]]()
        
        var temp = [Int]()
        for j in 0..<col {
            for i in 0..<row {
                temp.append(matrix[i][j])
                if temp.count == row {
                    newMatrix.append(temp)
                    temp = []
                }
            }
        }
        
        return newMatrix
    }
}

// 미리 배열 생성, 반대 인덱스로 채워넣기 
class Solution {
    func transpose(_ matrix: [[Int]]) -> [[Int]] {
        let row = matrix.count, col = matrix[0].count
        var result = [[Int]]()
        
        // n x m을 m x n으로 바꿔줌 
        for _ in 0..<col {
            let row = Array(repeating: 0, count: row)
            result.append(row)
        }
        
        for r in 0..<row {
            for c in 0..<col {
                result[c][r] = matrix[r][c]
            }
        }
        
        return result
    }
}

