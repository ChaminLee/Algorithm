class Solution {
    func checkInclusion(_ s1: String, _ s2: String) -> Bool {
        // s1이 더 크면 불가능
        if s1.count > s2.count { return false }
        
        // 26자리에 인덱스로 접근할 예정
        var alphabets = Array(repeating: 0, count: 26)
        
        // a의 아스키 넘버 
        let firstAscii = Character("a").asciiValue ?? 0
        
        // 각 문자의 아스키넘버에 a의 아스키 넘버를 빼고 배열로 반환
        let s1Arr = s1.map { Int(($0.asciiValue ?? 0) - firstAscii) }
        let s2Arr = s2.map { Int(($0.asciiValue ?? 0) - firstAscii) }
        
        // window 사이즈 만큼 우선 확인
        for i in 0..<s1.count {
            alphabets[s1Arr[i]] += 1 
            alphabets[s2Arr[i]] -= 1 
        }
        
        // alphabets 배열의 원소가 모두 0이라면 순열이 가능한 상황
        if check(alphabets) {
            return true
        }
        
        // 현재 가능하지 않은 상황이기에 window + 1씩 이동
        for i in s1.count..<s2.count {
            // 이전에 확인한 값은 다시 메꾸기
            alphabets[s2Arr[i - s1.count]] += 1
            // 새로운 값으로 비교 
            alphabets[s2Arr[i]] -= 1
            
            // 매번 확인
            if check(alphabets) {
                return true
            }
        }
        
        // 모든 경우에 대해서 다 불가하다면 false
        return false
    }
    
    // 배열에 0이 아닌 숫자가 있을 경우 false, 없다면 true
    func check(_ arr: [Int]) -> Bool {
        return arr.filter { $0 != 0 }.count == 0 ? true : false
    }
}
