class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        
        var dp = triangle
        
        for i in 1..<dp.count {
            for j in 0..<dp[i].count {
                // 가장 우측 원소들은 이전 행의 끝 값을 더해주고
                if i == j {
                    dp[i][j] += dp[i-1][j-1]
                // 가장 좌측 원소들은 이전 행의 첫 번째 값을 더해주고
                } else if j == 0 {
                    dp[i][0] += dp[i-1][0]
                // 중간의 값들은 이전 행의 j-1, j 중 최솟값을 더해준다. 
                } else {
                    dp[i][j] += min(dp[i-1][j], dp[i-1][j-1])
                }
            }
        }    
            
        return dp.last!.min()!
    }
}
