class Solution {
    func isPalindrome(_ s: String) -> Bool {
        // 빈 배열 생성
        var res = [Character]()
        
        // 소문자로 만들고
        for chr in s.lowercased() {
            // 문자 or 숫자일 경우,
            if chr.isLetter || chr.isNumber {
                // append 한다.
                res.append(chr)
            }
        }
        
        // index를 설정해주고
        var left = 0
        var right = res.count - 1
        // 만나기 전 까지
        while left < right {
            // 다를 경우 Palindrome이 아님
            if res[left] != res[right] { return false}
            
            // index 진행
            left += 1
            right -= 1
        }
        
        return true
    }
}
