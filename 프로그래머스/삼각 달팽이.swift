import Foundation

func solution(_ n:Int) -> [Int] {
    // 방향 
    // dx[0]dy[0] = 좌측 상단에서에서 좌측 하단으로 
    // dx[1]dy[1] = 좌측에서에서 우측으로 
    // dx[2]dy[2] = 우측 하단에서 좌측 상단으로
    let dx = [1,0,-1]
    let dy = [0,1,-1]
    // 초기값 세팅
    var row = 0, col = 0, dir = 0, num = 1
    
    // 비어있는 피라미드 만들기
    var arr = (1...n).map { Array(repeating: 0, count: $0) }

    // n = 4일 경우 3개 1개 > 2개 1개 > 1개 1개 > 1개 채움
    for i in stride(from: n, to: 0, by: -1) {
        for _ in 0..<i-1 {
            arr[row][col] = num
            row += dx[dir]
            col += dy[dir]
            num += 1
        }
        arr[row][col] = num
        print(num)
        num += 1
        dir = (dir + 1) % 3
        row += dx[dir]
        col += dy[dir]
    }

    return arr.flatMap {$0}
}
