class Solution {
    func climbStairs(_ n: Int) -> Int {
        if n < 3 { return n }
        
        var res = Array(repeating: 0, count: n)
        
        res[0] = 1
        res[1] = 2
        
        for i in 0..<n-2 {
            res[i+2] = res[i] + res[i+1]
        }
        
        return res.last!
    }
}
