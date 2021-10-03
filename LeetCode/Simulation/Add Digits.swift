class Solution {
    func addDigits(_ num: Int) -> Int {
        var num = num
        
        while num > 9 {
            var sum = 0
            
            while num != 0 {
                sum += (num % 10)
                num /= 10
            }
            
            num = sum
        }
        
        
        return num
        
    }
}
