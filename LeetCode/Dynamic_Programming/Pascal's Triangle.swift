class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var dp = [[1],[1,1]]
        if numRows < 2 { return [[1]] }
        
        for i in 2..<numRows {
            var temp = [Int]()
            
            // 처음과 끝은 1로
            for j in 0...i {
                if j == 0 || j == i {
                    temp.append(1)
                // 중간은 이전 행의 j-1, j번째의 합으로 구하기
                } else {
                    temp.append(dp[i-1][j-1]+dp[i-1][j])
                }
            }
            // 행 추가 
            dp.append(temp)
        }
        
        
        return dp 
    }
}
