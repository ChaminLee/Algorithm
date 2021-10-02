// first solution - beats 100%
class Solution {
    func numRookCaptures(_ board: [[Character]]) -> Int {
        let dir = [0,-1,0,1,0]
        var captures = 0
        var rp = (0,0)
        
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] == "R" {
                    rp = (i,j)
                }
            }
        }
        
        // up 
        var up = rp.0 - 1
        while up >= 0 {
            if board[up][rp.1] == "p" {
                captures += 1
                break
            } else if board[up][rp.1] == "." {
                up -= 1                                
            } else {
                break
            }
        }
        
        // down
        var down = rp.0 + 1
        while down < board.count {
            if board[down][rp.1] == "p" {
                captures += 1
                break
            } else if board[down][rp.1] == "." {
                down += 1                                
            } else {
                break
            }
        }
        
        // left 
        var left = rp.1 - 1
        while left >= 0 {
            if board[rp.0][left] == "p" {
                captures += 1
                break
            } else if board[rp.0][left] == "." {
                left -= 1                                
            } else {
                break
            }
        }
        
        // right 
        var right = rp.1 + 1
        while right < board[0].count {
            if board[rp.0][right] == "p" {
                captures += 1
                break
            } else if board[rp.0][right] == "." {
                right += 1                                
            } else {
                break
            }
        }        
        
        return captures
    }
}

// solution with moudle

class Solution {
    func numRookCaptures(_ board: [[Character]]) -> Int {
        var captures = 0
        var r = 0, c = 0
        
        for i in 0..<board.count {
            for j in 0..<board[0].count {
                if board[i][j] == "R" {
                    r = i
                    c = j
                    break
                }
            }
        } 
                
        check(r, c, 1, 0, board, &captures)
        check(r, c, -1, 0, board, &captures)
        check(r, c, 0, 1, board, &captures)
        check(r, c, 0, -1, board, &captures)
        
        print(captures)
        
        return captures
    }
    
    func check(_ r: Int, _ c: Int, _ x: Int, _ y: Int, _ board: [[Character]], _ cnt: inout Int) {
        var nr = r + x
        var nc = c + y
        
        while (0..<8).contains(nr) && (0..<8).contains(nc) {
            if board[nr][nc] == "." {
                nr += x
                nc += y
            } else if board[nr][nc] == "p" {
                cnt += 1
                break
            } else {
                break
            }
        }                
    }
}
