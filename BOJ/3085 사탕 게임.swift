import Foundation

let n = Int(readLine()!)!
var board = [[String]](repeating: [], count: n)
var result = 0

for i in 0..<n {
    let input2 = readLine()!.map { String($0) }
    board[i] = input2
}

func findLongestColor() {
    for i in 0..<n {
        for j in 0..<n-1 {
            board[i].swapAt(j, j+1)
            findHorizontal()
            findVertical()
            board[i].swapAt(j, j+1)
            
            let temp = board[j][i]
            board[j][i] = board[j+1][i]
            board[j+1][i] = temp
            
            findHorizontal()
            findVertical()
            
            let temp2 = board[j][i]
            board[j][i] = board[j+1][i]
            board[j+1][i] = temp2
        }
    }
}

func findHorizontal() {
    for i in 0..<n {
        var count = 1
        for j in 0..<n-1 {
            // 가로
            if board[i][j] == board[i][j+1] {
                count += 1
            } else {
                result = max(result, count)
                count = 1
            }
            result = max(result, count)
        }
    }
}

func findVertical() {
    for i in 0..<n {
        var count = 1
        for j in 0..<n-1 {
            // 세로
            if board[j][i] == board[j+1][i] {
                count += 1
            } else {
                result = max(result, count)
                count = 1
            }
            result = max(result, count)
        }
    }
}

findLongestColor()
print(result)
