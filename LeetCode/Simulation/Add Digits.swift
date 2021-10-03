class Solution {
    func addDigits(_ num: Int) -> Int {
        // 값 바꾸기 위해
        var num = num
        
        // 두 자리 이상인 경우 계속 진행
        while num > 9 {
            // 새로운 num을 구하기 위한 합
            var sum = 0
            
            // 계속 나눠가면서
            while num != 0 {
                // 나머지 = 가장 마지막 자리 수를 계속 sum에 더함
                sum += (num % 10)
                // num은 계속 10으로 나눈 몫으로 할당해준다. 즉 한 자리 수 씩 줄이기
                num /= 10
            }
            // num을 sum으로 대체 
            num = sum
        }         
        
        return num        
    }
}
