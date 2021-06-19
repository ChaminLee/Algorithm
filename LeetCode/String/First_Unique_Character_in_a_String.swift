class Solution {
    func firstUniqChar(_ s: String) -> Int {
        // key & value 쌍으로 만들기
        var tes = Dictionary(s.map {($0,1)},uniquingKeysWith : +)
        // 앞에서 부터 원소들과 비교
        for (i,n) in s.enumerated() {
            // 가장 먼저 value가 1인 값의 index 반환
            if tes[n] == 1 {
                return i
            }
        }
        // 값이 없을 경우 -1 반환
        return -1
    }
}
