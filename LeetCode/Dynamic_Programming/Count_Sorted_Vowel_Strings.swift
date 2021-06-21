class Solution {
    func countVowelStrings(_ n: Int) -> Int {
        // 기본 배열
        var res = [1,1,1,1,1]
        // n만큼 반복
        for i in 1...n {
            // 이전 값들을 계속 더해준다. 
            // 결국에 가장 마지막 원소는 
            // 이전의 원소들을 다 더한 값이 된다.
            for j in 1...4 {
                res[j] += res[j-1]
            }
            
        }
        return res.last!
    }
}
