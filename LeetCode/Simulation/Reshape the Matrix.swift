// 공식 이용, 열을 기준으로 몫, 나머지 사용 
class Solution {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        let row = mat.count, col = mat[0].count
        guard row * col == r * c else { return mat }
        
        var newMat = Array(repeating: Array(repeating: 0, count: c), count: r)
        var i = 0
        
        while i < r * c {
            newMat[i / c][i % c] = mat[i / col][i % col]  
            i += 1
        }
        
        return newMat
    }
}

// 열 기준으로 쌓기 
class Solution {
    func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        let row = mat.count, col = mat[0].count
        guard row * col == r * c else { return mat }
        
        var newMat = [[Int]]()
        
        var temp = [Int]()
        for i in 0..<row {            
            for j in 0..<col {
                temp.append(mat[i][j])
                if temp.count == c {
                    newMat.append(temp)
                    temp = []
                }                
            }
        }
        
        return newMat
    }
}
