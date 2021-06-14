class Solution {
    func reverse(_ x: Int) -> Int {
        // 결과를 저장하기 위한 res
        var res = 0 
        // 기존 x는 let이기에 var로 변경
        var x = x
        
        // x 가 0이 될 때까지
        while x != 0 { 
            res *= 10
            res += x % 10
            x /= 10
            
            // 문제 조건 맞추기
            if res < Int(Int32.min) || res > Int(Int32.max) {
                return 0
            }
        }
        return res
    }
}
