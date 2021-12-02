// Logic
// 1. 불필요하게 반복되는 연산을 막기 위해, 통과하지 못하는 케이스들의 Set을 만들어준다.
// 2. 나머지를 구하고 10으로 나눠주는 과정을 반복하며 새로운 수를 구한다.
// 3. 새로운 수가 1이라면 true, 아니라면 Set에 추가해주고 계속 이어서 진행한다. 
// 4. 새로운 수를 기존의 number에 넣어 대체한다. 

// Solution
class Solution {
    func isHappy(_ n: Int) -> Bool {
        var number = n
        var history = Set<Int>()
        
        while true {
            var newNumber = 0
            
            while number > 0 {    
                let remainder = number % 10
                newNumber += remainder * remainder
                number /= 10 
            }
            
            if newNumber == 1 {
                return true
            } else if history.contains(newNumber) {
                return false
            } else {
                history.insert(newNumber)
            }
            
            number = newNumber
        }
    }
}
