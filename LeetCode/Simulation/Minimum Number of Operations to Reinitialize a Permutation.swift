class Solution {
    func reinitializePermutation(_ n: Int) -> Int {
        // 초기 perm 배열 설정 
        var perm = [Int](0..<n)
        // 복사
        let initPerm = perm
        // 새로 만들 배열
        var arr = [Int](repeating: 0, count: n)
        // 횟수
        var cnt = 0
        
        // 반복
        repeat {
            // arr 값 채우기
            for i in 0..<n {
                arr[i] = i % 2 == 0 ? perm[i / 2] : perm[n / 2 + (i - 1) / 2] 
            }
            // perm을 arr로
            perm = arr
            cnt += 1
        // perm과 initPerm이 같아질 때까지
        } while initPerm != perm 
        
        return cnt
    }
}
