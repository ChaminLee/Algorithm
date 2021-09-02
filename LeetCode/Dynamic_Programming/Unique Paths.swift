class Solution {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        // 행과 열은 0보다 커야 함.
        guard m > 0, n > 0 else { return 0 }
        
        // 모두 1로 채워진 동일한 크기의 행렬 생성
        var dp = Array(repeating: Array(repeating: 1, count: n), count: m)
        
        // 행렬을 돌며 좌측값 + 위의값 = 현재값으로 연산해나간다. 
        for i in 1..<m {
            for j in 1..<n {
                dp[i][j] = dp[i-1][j] + dp[i][j-1]
            }
        }                
        
        // 마지막 행의 마지막 원소
        return dp.last!.last!
    }
}

