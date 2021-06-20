class Solution {
    func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
        var receive = Array(repeating: 0, count: n+1) 
        var send = Array(repeating: 0, count: n+1) 
        
        for t in trust {
            receive[t[1]] += 1
            send[t[0]] += 1
        }
        
        for p in 1...n {
            if receive[p] == n - 1 && send[p] == 0 { 
                return p
            }
        }
        
        return -1 
    }
}
