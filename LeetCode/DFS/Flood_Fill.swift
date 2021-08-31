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



// 풀이 추가 - DFS with directions
class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        // x,y 방향을 잡아주기 위함 
        let dirX = [0,0,-1,1]
        let dirY = [-1,1,0,0]
        
        // 행, 열 미리 구해두기
        let row = image.count
        let col = image[0].count 
        
        // 새로 채워줄 행렬
        var matrix = image 
        let target = image[sr][sc]
        
        // 바꾸고자 하는 색이 기존 색과 같다면 행렬을 바꿀 필요가 없음
        if target == newColor {
            return image
        }
        
        // 처음에 고른 칸 미리 칠해주기
        matrix[sr][sc] = newColor
        
        // DFS
        func DFS(_ start: [Int]) {
            var nextVisit = [[Int]]()
            nextVisit.append(start)
            
            while !nextVisit.isEmpty {
                let point = nextVisit.removeLast()
                
                // 상하좌우 인덱스 추가 고려 
                for (r,c) in zip(dirX, dirY) {
                    let newX = point[0] + r   
                    let newY = point[1] + c
                    // 인덱스가 범위 내에 있고
                    if (newX >= 0 && newX < row) && (newY >= 0 && newY < col) {
                        // 타겟 컬러와 같아야 함 
                        if matrix[newX][newY] == target {
                            matrix[newX][newY] = newColor
                            nextVisit.append([newX, newY])
                        }
                    }
                }
            }
        }
        
        DFS([sr,sc])
        
        return matrix
    }
}

// 풀이 추가 - recursive
class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        // 행,렬 미리 연산
        let row = image.count
        let col = image[0].count
        
        // 타겟컬러
        let target = image[sr][sc]
        // 변경할 행렬
        var matrix = image 
        
        func fill(_ x: Int, _ y: Int) {
            // 고른 색과 바꿀 색이 달라야 함. 고른 색과 주변의 색이 같아야 함
            guard target != newColor, target == matrix[x][y] else { return }
            
            // 주변 색 칠하기
            matrix[x][y] = newColor
            
            // 행이 0보다 크다면 -1해서 인접 값 찾아도 됨
            if x > 0 {
                fill(x-1, y)
            }
            
            // 행이 row-1보다 작다면 +1해서 인접 값 찾아도 됨
            if x < row-1 {
                fill(x+1, y)
            }
            
            // 열이 0보다 크다면 -1해서 인접 값 찾아도 됨
            if y > 0 {
                fill(x, y-1)
            }
            
            // 열이 col-1보다 작다면 +1해서 인접 값 찾아도 됨
            if y < col-1 {
                fill(x, y+1)
            }
        }
        
        // 채우기
        fill(sr,sc)
        
        return matrix
        
    }
}
