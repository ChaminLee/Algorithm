import Foundation

func solution(_ board: [[Int]]) -> Int {
    // board 복사 (값 변경을 위해!)
    var board = board
    
    // 행
    for i in 1..<board.count {
        // 열
        for j in 1..<board[0].count {
            // 위의 원소 
            let up = board[i][j-1]
            // 왼쪽 원소
            let left = board[i-1][j]
            // 대각 왼쪽 위 원소 
            let diag = board[i-1][j-1]
            // 3개 값 중 최솟값을 구해서
            let minval = min(up,min(left,diag))
            // 기준값과 다시 비교해서 최솟값을 구했을 때 0이 나오면 정사각형은 못만드는 것
            // 1이나 다른 값이 나왔다면 만들 수 있다는 것 
            if min(board[i][j], minval) == 0 {
                continue
            } else {
                // 만들 수 있는 경우이기에 기준에 +1을 해줘서 정사각형의 크기를 채워나간다
                board[i][j] = minval + 1
            }
        } 
    }

    // 최대 크기 구하기
    let rect = board.flatMap {$0}.max()!
    return rect * rect
}
