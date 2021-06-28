class Solution {
    func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
        // 최종 결과
        var result = [[Int]]()
        // 가능한 노선을 담을 곳
        // 항상 0부터 시작
        var path = [0]
        // DFS
        DFS(graph,0,&path,&result)
        return result
    }
    // DFS + Backtracking
    func DFS(_ graph: [[Int]], _ node: Int, _ path: inout [Int], _ result: inout [[Int]]) {
        // 현재 node가 가장 큰 원소 값(=끝)이라면 path를 result에 추가 
        if node == graph.count - 1 {
            return result.append(path)
        }
        // 다음 값들을 돌며
        for v in graph[node] {
            // 추가해주고 
            path.append(v)
            // 재귀를 돌아준다
            DFS(graph,v,&path,&result)
            // 탐색을 마친 원소에 대해서는 제거해준다(backtracking)
            path.removeLast() 
        }
    }
}
