import Foundation

func solution(_ tickets:[[String]]) -> [String] {
    // 방문 여부를 기록하기 위한 배열 
    var visited = Array(repeating: false, count: tickets.count)
    // 문제의 조건에 맞게 우선적으로 도착 지점의 알파벳 순서대로 정렬시켜둔다. 
    var tickets = tickets.sorted { $0[1] < $1[1] }
    // 최종 결과 저장을 위한 배열 
    var result = [String]()

    func DFS(_ start: String) {
        // DFS의 값을 리턴하기 위함 
        if result.count == tickets.count {
            // 방문한 곳 개수와 전체 노선의 개수가 같다는 것은 현재 마지막 비행이라는 것
            // 이에 마지막 도착지를 append 해줌으로써 아래 tickets.count + 1에 걸리게 된다. 
            result.append(start)
            return 
        }
        // 재귀적으로 tickets를 처음부터 돌며 출발 지점과 같은지 찾기 위함 
        for i in 0..<tickets.count {
            // 출발 지점과 tickets[i][0]이 같고 아직 방문하지 않은 노선이라면 해당 노선을 선택하여 비행 
            if start == tickets[i][0] && !visited[i] {
                // 노선을 선택했으니 다녀간 노선으로 체크 
                visited[i] = true
                // 다녀간 노선이기에 출발지를 기록해둔다. 
                result.append(start)
                // 출발지는 result에 입력했으니 이제 도착지를 새로운 출발지로 하여 노선을 다시 선택해야 한다. 
                DFS(tickets[i][1])
                // 다녀간 지점들의 개수가 노선의 개수 + 1개라면 결과값 리턴 
                // 노선은 두 개가(A,B) 한 쌍이기에 + 1 해줘야 다녀간 지점들의 개수와 같아진다. 
                if result.count == tickets.count + 1 {
                    return       
                }
                // 모든 노선을 들르지 못하는 경우, 이전 출발지부터 다시 시작 (출발지점 회수, 방문표기 취소)
                result.removeLast()
                visited[i] = false 
            }   
        }
    }

    DFS("ICN")
    return result
}
