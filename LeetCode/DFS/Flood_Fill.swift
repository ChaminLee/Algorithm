class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        // 열
        let m = image[0].count
        // 행
        let n = image.count
        // 변경된 값을 적용해 줄 배열
        var result = image
        // 타겟값 (= 주변이 이 값과 같다면 바꿀 대상이 됨)
        let target = image[sr][sc]
        
        // 내가 선택한 값과 바꿔야 할 값이 같다면, 그냥 그대로 반환
        if target == newColor {
            return image
        }
        
        // 먼저 선택한 값은 바꿔준다. 
        result[sr][sc] = newColor
        
        func DFS(_ start: [Int]) {
            // 방문할 (i,j)
            var nextVisit = [[Int]]()
            nextVisit.append(start)
        
            while !nextVisit.isEmpty {
                let next = nextVisit.removeLast()
                // 인접 (up,down,left,right) 원소들 나열
                for adj in findAdj(next,m,n) {
                    // 그 값이 target과 같을 때
                    if result[adj[0]][adj[1]] == target {
                        // 값을 변경해주고
                        result[adj[0]][adj[1]] = newColor
                        // 다음에 방문할 배열에 넣어준다. 
                        nextVisit.append(adj)
                    }
                }
            }
        }
        // 시작점 
        DFS([sr,sc])
        
        return result
    }
    
    // 대각선 제외 인접(up,down,left,right) index들을 구한다.
    func findAdj(_ coor: [Int],_ m: Int, _ n: Int) -> [[Int]] {
            var res = [[Int]]()
            var x = coor[0]
            var y = coor[1]
            let u = [x,y-1]
            let d = [x,y+1]
            let l = [x-1, y]
            let r = [x+1,y]
            
            let dir = [u,d,l,r]
            for d in dir {
                // index 범위에 충족한다면 추가
                if (d[0] >= 0 && d[0] < n) && (d[1] >= 0 && d[1] < m) {
                    res.append(d)
                }
            }
            return res
        }
}
