class Solution {
    func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
        // vertex의 연결 유무 확인을 위함
        var temp = Array(repeating: 0, count: n)        
        var ans = [Int]()
        // 노선들을 돌며
        for edge in edges {
            // 연결되어 있다면 1씩만 추가해준다.
            if temp[edge[1]] == 0 {
                temp[edge[1]] += 1
            }
        }      
        // 0인 경우 index를 저장한다. 
        for i in 0..<temp.count {
            if temp[i] == 0 {
                ans.append(i)
            }
        }
        return ans
    }
}
