class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        // -인 경우는 모두 false
        if x < 0 { return false }        
        var y = x, reversed = 0
        
        // 0이 될 때까지 나눠줌
        while y != 0 {
            // 1의 자리 * 10을 하며 뒤집어주기
            reversed = reversed * 10 + (y % 10)
            y /= 10                         
        }        
        return reversed == x
    }    
}
