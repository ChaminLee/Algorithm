class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        // 배열로 변환
        var num1 = num1.map { String($0) }
        var num2 = num2.map { String($0) }
        
        // past : 합이 두 자리 이상이 될 경우 다음 번에 1 더해줘야 함
        // ex. 8 + 9 = 17이기에 7은 더해주고 1은 보관해뒀다가 다음에 더해줘야함 
        var past = 0, res = ""
        
        // 둘 중에 하나 빌 때 까지 
        while !num1.isEmpty || !num2.isEmpty {
            let left = num1.isEmpty ? 0 : Int(num1.removeLast()) ?? 0
            let right = num2.isEmpty ? 0 : Int(num2.removeLast()) ?? 0
            
            let sum = past + left + right 
            res = "\(sum % 10)" + res
            past = sum / 10
        }
                
        // past가 아직 값이 있다면, 즉 1 더해줘야함
        return past == 1 ? "1" + res : res
    }
}
