// 직관적 풀이
class Solution {
    func mostVisited(_ n: Int, _ rounds: [Int]) -> [Int] {
        // 총 방문횟수 기록
        var visited = Array(repeating: 0, count: n)
        // 결과 배열 
        var result = [Int]()
        
        // rounds를 순회하며 시작점이 다음 포인트까지 가기 위해 거쳐야하는 경로에 모두 +1 해줌
        for i in 1..<rounds.count {
            var start = rounds[i-1]
            
            while start != rounds[i] {
                visited[start-1] += 1
                
                // 다음 값으로 이동을 위해 + 1 해줌, 그 전에 나머지로 판별하여 n보다 크지 않도록 함 
                start = (start % n) + 1
            }
        }
        
        // 처리 못한 마지막 round 반영
        visited[rounds[rounds.count - 1] - 1] += 1
        
        // 최대 방문 횟수와 같은 section을 결과에 반영
        for i in 0..<visited.count {
            if visited[i] == visited.max()! {
                result.append(i+1)
            }
        }
        
        return result
    }
}


// 신박한 풀이 - 처음과 끝으로 총 몇 바퀴 돌았는지 추정 
class Solution2 {
    func mostVisited(_ n: Int, _ rounds: [Int]) -> [Int] {
        // 시작과 끝
        let start = rounds[0], end = rounds[rounds.count - 1]
        // 끝이 시작보다 크거나 같다면 일반적으로 n바퀴 돌았거나, 돌고 있는 중이기에 start ~ end까지가 가장 방문횟수가 크다. 
        // 시작이 끝보다 클 경우 n바퀴 + k/n 바퀴를 돌고 있는 것이기에 우선 start가 end 보다 크다는 것은 최소 1바퀴는 돌았다는 것이기에
        // 1...end(여기서 end는 초반부를 가리킴)를 더해주고, 그 다음 start...n을 더해준다. 
        return end >= start ? [Int](start...end) : [Int](1...end) + [Int](start...n)
    }
}
