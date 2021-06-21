// 첫 풀이 
class Solution {
    func countBits(_ n: Int) -> [Int] {
        // 1의 갯수를 세줌
        
        for i in 0...n {
            ans.append(String(i, radix: 2).filter {$0 == "1"}.count)
        }
        return ans 
    }
}




// 비트 연산 사용 풀이
class Solution {
    func countBits(_ n: Int) -> [Int] {
        if n == 0 {
            return [0]
        }
        // 0,1인 경우 모두 적어두고
        var ans = [0,1]
        // 2부터 시작
        var idx = 2
        // n까지 조건을 주고 돌면서
        while idx <= n {
            // ans[몫] + ans[나머지]
            // 비트 연산으로 계산
            ans.append(ans[idx >> 1] + ans[idx % 2])
            idx += 1
        }

        return ans
    }
}
