class Solution {
    func findCenter(_ edges: [[Int]]) -> Int {
        // 최대 vertex의 값
        let mxnum = edges.flatMap {$0}.max()!
        // 노선 연결 정도를 저장
        var nodes = Array(repeating: 0, count: mxnum)
        // 인덱스에 맞게 추가 
        for edge in edges {
            nodes[edge[0]-1] += 1
            nodes[edge[1]-1] += 1
        }
        
        // 중앙에 위치하려면 최대 - 1만큼 연결되어 있어야 한다. 
        return nodes.firstIndex(of: mxnum-1)! + 1
    }
}
