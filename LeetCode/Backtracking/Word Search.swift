// solution 1
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        // 방향 
        var dir = [0,-1,0,1,0]
        // 행 열 
        let row = board.count, col = board[0].count
        // 방문 여부
        var visited = Array(repeating: Array(repeating: false, count: col), count: row)
        // 인덱싱을 위해 배열로 변환
        var words = Array(word)
        // 배열 안에서 찾을 수 있는지 여부 (= flag)
        var result = false
                
        // backtracking
        func backtrack(_ i: Int, _ j: Int, _ idx: Int) {
            // 1. 인덱스가 범위 안이어야 함
            // 2. 해당 인덱스의 값이 문자열의 인덱싱 값과 같아야 함
            // 3. 방문하지 않았어야 함
            guard i >= 0 && i < row && j >= 0 && j < col && board[i][j] == words[idx] && !result && !visited[i][j] else {
                return 
            }
            
            // idx가 word.count - 1이라는 것은 끝까지 만들 수 있다는 것!
            if idx == words.count - 1 {
                // 결과를 true로 바꿔줌
                result = true
                return 
            }
            
            // 방문 체크
            visited[i][j] = true
            
            // 현재 인덱스 기준 상,하,좌,우 확인
            for k in 0..<4 {
                backtrack(i+dir[k], j+dir[k+1], idx+1)
            }
            
            // backtrack을 위해 방문 체크 해제
            visited[i][j] = false
        }
        
        
        for i in 0..<row {
            for j in 0..<col {
                // 선택 값이 문자열 첫 번째일 경우 = 시작점
                if board[i][j] == words[0] {
                    backtrack(i,j,0)
                }
            }
        }
        
        return result
    }
}


// solution 2 
class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let row = board.count, col = board[0].count
        var visited = Array(repeating: Array(repeating: false, count: col), count: row)
        var words = Array(word)
        
        for i in 0..<row {
            for j in 0..<col {
                if board[i][j] == words[0] {
                    if backtrack(board, i, j, 0, &visited, words) {
                        return true
                    }
                }
            }
        }          
        
        return false
    }
    
    func backtrack(_ board: [[Character]], _ i: Int, _ j: Int, _ idx: Int, _ visited: inout [[Bool]],_ word: [Character]) -> Bool {
        // idx가 word의 길이보다 작을 때만
        guard idx < word.count else { return true }
        
        // 1. 인덱스가 범위 안이어야 함
        // 2. 해당 인덱스의 값이 문자열의 인덱싱 값과 같아야 함
        // 3. 방문하지 않았어야 함 
        guard (i >= 0 && i < board.count) && (j >= 0 && j < board[0].count) && board[i][j] == word[idx] && !visited[i][j] else {
            return false
        }
        
        // 방문 체크
        visited[i][j] = true
            
        // 상하좌우 확인
        let result = backtrack(board, i-1, j, idx+1, &visited, word) || // top
            backtrack(board, i+1, j, idx+1, &visited, word) || // bottom
            backtrack(board, i, j-1, idx+1, &visited, word) || // left
            backtrack(board, i, j+1, idx+1, &visited, word) // right

        // 방문 체크 해제
        visited[i][j] = false
        
        return result
    }
}
