class Solution {
    func getLucky(_ s: String, _ k: Int) -> Int {
        var str = ""
        for w in s {
            str += "\(w.asciiValue! - 96)"
        }
        
        var times = 0
        
        while times < k {            
            str = "\(str.map { Int(String($0))! }.reduce(0,+))"
            times += 1
        }
        
        return Int(str)!
    }
}
