class Solution {
    func reverseString(_ s: inout [Character]) {
        // 그냥 s.reverse() 사용하면 풀리긴 함..! 
        
        // 좌/우 인덱스를 정해준다. 
        var left = 0
        var right = s.count - 1
        
        // 만나는 순간 끝낼 수 있도록 
        while left < right {
            // left 값 저장해두고
            var temp = s[left]
            // left 값을 right 값으로 변경하고
            s[left] = s[right]
            // 저장해둔 left값을 rigth 값으로 변경
            s[right] = temp
            
            // 인덱스는 한 칸씩 +/-
            left += 1
            right -= 1
        }
        
    }
}
