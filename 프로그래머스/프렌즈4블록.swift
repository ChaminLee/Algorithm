func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    // indexing 가능하도록 바꿔준다. 
    var board = board.map {$0.map {String($0)}}
    
    // 아까 본 지표랑 같은 목적
    var signal = true
    repeat {
        let boardcopy = board
        let duplicated = findBox(n,board)
        removeAndMoveBox(m, &board, duplicated)
        signal = boardcopy != board
    } while signal
    
    return board.map {$0.filter{ $0 == "*"}.count}.reduce(0,+)
}

func findBox(_ n: Int, _ board: [[String]]) -> [[Int]] {
    // 지울 블록의 Index를 저장하기 위함
    var duplicated = [[Int]]()
    
    // 행
    for i in 0..<board.count-1 {
        // 열
        for j in 0..<n-1 {
            // 계속 적어주기 귀찮으니 할당
            let v = board[i][j]
            // 기준이 되는 원소 v가 "*" 가 아니고 바로 옆 원소와 동일할 때 다음 단계로 이동
            if v != "*" && v == board[i][j+1] {
                let v2 = board[i+1][j]
                // 그 다음 단계 : 바로 아래줄의 2개를 확인 > 똑같다면 지워줘야 할 블록 index list에 append
                if v == v2 && v == board[i+1][j+1] {
                    if !duplicated.contains([i,j]) {
                        duplicated.append([i,j])
                    }
                    if !duplicated.contains([i,j+1]) {
                        duplicated.append([i,j+1])
                    }

                    if !duplicated.contains([i+1,j]) {
                        duplicated.append([i+1,j])
                    }

                    if !duplicated.contains([i+1,j+1]) {
                        duplicated.append([i+1,j+1])
                    }
                } // 위 조건 안맞는 것들은 그냥 패스!
            } 
        }
    }
    return duplicated
}

func removeAndMoveBox(_ m: Int, _ board: inout [[String]], _ dup: [[Int]]) {
    // remove
    for d in dup {
        board[d[0]][d[1]] = "*"
    }
    
    // 반복문 종료를 위한 지표
    var signal = true
    
    repeat {     
        // 더 이상 배열이 바뀌지 않으면 종료되도록!
        var boardcopy = board
        // 행
        for i in 0..<board.count {
            // 열
            for j in 0..<m-1 {   
                // 세로를 기준으로 봐야한다. 
                // A * * A라면 중간 값들을 모두 지나치고 * * A A가 되어야 한다. 
                // 그렇기에 다음 값을 기준으로 판단하고 값들을 변경해준다. 
                if board[j+1][i] == "*" {
                    board[j+1][i] = board[j][i]
                    board[j][i] = "*"
                }
            }
        }
        // 카피와 원본이 같아지는 순간이 바로 더 이상 옮길 블록이 없다는 것이다. 
        signal = board != boardcopy
    } while signal
    
}