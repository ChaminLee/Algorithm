class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        var result = 0
        
        // 두번째자리부터 26 * 1 
        for c in columnTitle {
            result *= 26
            result += Int(c.asciiValue!) - 64
        }
        
        return result
    }
}
