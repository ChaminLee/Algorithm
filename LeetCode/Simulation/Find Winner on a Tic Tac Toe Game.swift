class Solution {
    func tictactoe(_ moves: [[Int]]) -> String {        
        // tic tac toe 게임판 
        var grid = Array(repeating: Array(repeating: "", count: 3), count: 3)
        
        // tic tac toe 게임판 채우기
        for i in 0..<moves.count {
            let move = moves[i]
            if i % 2 == 0 {
                grid[move[0]][move[1]] = "A"
            } else {
                grid[move[0]][move[1]] = "B"
            }            
        }
        
        // A가 승리하는 경우
        if game(grid,"A") {
            return "A"
        // B가 승리하는 경우
        } else if game(grid,"B") {
            return "B"
        // A,B 모두 이기지 못하는데 판은 꽉 차있는 경우 = 무승부
        } else if moves.count == 9 {
            return "Draw"
        // A,B 모두 이기지 못하는데 아직 판은 채워져있지 않은 경우 = 진행 중
        } else {
            return "Pending"
        }
    }
    
    // 게임 승패 여부 판단 
    func game(_ grid: [[String]], _ player: String) -> Bool {
        // 초기값 false
        var win = false
        
        // 각 행을 돌며
        for i in 0..<3 {    
            // 세로줄
            var col = [String]()
            // 대각선 - 왼쪽위 ~ 오른쪽 아래
            var diag = [String]()
            // 대각선 - 오른쪽 위 ~ 왼쪽 아래
            var revDiag = [String]()
            
            // 값 할당
            for j in 0..<3 {
                col.append(grid[j][i])
                diag.append(grid[j][j])
                revDiag.append(grid[j][2-j])
            }
            
            // 판단 
            for ele in [grid[i], col, diag, revDiag] {
                if ele.filter { $0 == player }.count == 3 {
                    return true
                }
            }            
        }
        
        return win
    }
}
