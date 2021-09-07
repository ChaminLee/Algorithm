// Soulution - Backward
class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: temperatures.count)
        var stack = [(Int,Int)]()
        // 뒤에서 부터 확인
        var idx = temperatures.count - 1
        
        while idx >= 0 {
            // temperatures[idx]가 더 높다는 건 이전 값이 더 온도가 높다는 것
            while !stack.isEmpty && temperatures[idx] >= stack.last!.1 {
                // 이에 스택 원소 제거하여 다음값 비교
                stack.removeLast()
            }
            
            // 비어있지 않을 때, 즉 현재보다 큰 값이 stack에 있을 때 
            if !stack.isEmpty {
                result[idx] = stack.last!.0 - idx
            }
            
            stack.append((idx,temperatures[idx]))
            
            idx -= 1
        }
        
        return result
    }
}

// Solution - Forward 
class Solution {
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result = Array(repeating: 0, count: temperatures.count)
        var stack = [(Int,Int)]()
        // 초기 세팅
        stack.append((0, temperatures[0]))
        
        for i in 1..<temperatures.count {
            // 스택의 가장 마지막 원소 꺼내기 위함
            var j = stack.count - 1
            
            while !stack.isEmpty {
                // 다음 값이 더 큰 경우, 이전과 비교하여 값 추가 
                if temperatures[i] > stack[j].1 {
                    // stack에서 나오는 원소 인덱스를 기준으로 결과 갱신
                    result[stack[j].0] = i - stack[j].0
                    // 마쳤으면 빼주기
                    stack.remove(at: j)
                } else {
                    break
                }
                // stack의 다음 요소를 확인하기 위함
                j -= 1
            }
            
            stack.append((i,temperatures[i]))
        }
        
        return result
    }
}
