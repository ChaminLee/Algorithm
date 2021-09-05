import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    // key, lock의 크기 구하기 
    let m = key.count, n = lock.count
    // 기존 lock의 크기의 세 배인 배열 생성
    var newLock = Array(repeating: Array(repeating: 1, count: n*3), count: n*3)
    // 키 회전시키기 위해 복제 
    var key = key
    
    // 큰 lock 중앙에 기존 lock 원소 넣기
    for i in n..<2*n {
        for j in n..<2*n{
            newLock[i][j] = lock[i-n][j-n]
        }        
    }
    
    // 반복횟수
    var time = 0
    
    // 4방향 체크
    while time < 4 {
        // 최소 : n-m+1 , 최대 : 2n-1
        for i in n-m+1...2*n-1 {
            for j in n-m+1...2*n-1 {
                // 매번 새로운 lock으로 계산
                var temp = newLock
                // 겹치는 부분 더하기
                operate(&temp, key, i, j)
                
                // 해당 lock 부분을 펼쳐줌 
                let check = temp[n..<2*n].flatMap { Array($0[n..<2*n]) }
                
                // 모두 1이어야 열쇠 구멍에 맞는 것
                if check.filter { $0 == 1 }.count == n*n {
                    return true
                }
            }            
        }
        // 시계 방향 90도 회전시키기
        key = rotate90(key)
        // 횟수 추가 
        time += 1
    }
    
    return false
}

// 겹치는 부분 연산
func operate(_ grid: inout [[Int]], _ key: [[Int]], _ r: Int, _ c: Int) {
    let m = key.count
    for i in 0..<m {
        for j in 0..<m {
            grid[i+r][j+c] += key[i%m][j%m]
        }
    }
}

// 배열 시계방향 90도 회전
func rotate90(_ key: [[Int]]) -> [[Int]] {
    let m = key.count
    var rotated = Array(repeating: Array(repeating: 0, count: m), count: m)
    
    for i in 0..<m {
        for j in stride(from: m - 1, through: 0, by: -1) {
            rotated[i][m - (j+1)] = key[j][i]
        }
    }
    
    return rotated
}
