class Solution {
    func getMaximumGenerated(_ n: Int) -> Int {
        var arr = [0,1]
        
        // 1 이하일 때는, 인덱싱 후 최댓값 찾기 
        guard n > 1 else { return arr[0...n].max()! }
        
        // 홀/짝 케이스 나눠서 공식에 맞게 배열에 추가
        for i in 2...n {
            if i % 2 == 0 {
                arr.append(arr[i / 2])
            } else {
                arr.append(arr[i / 2] + arr[i / 2 + 1])
            }
        }
        
        return arr.max()!
    }
}
