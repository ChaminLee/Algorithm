import Foundation

func solution(_ places:[[String]]) -> [Int] {
    // 결과 저장
    var result = [Int]()
    
    for place in places {
        // P의 좌표를 담을 리스트
        var students = [(Int,Int)]()
        // 인덱스 접근을 위해 원소 단위로 나눠준다. 
        let p = place.map { $0.map { String($0) } }
        
        // P인 경우 좌표를 저장해준다. 
        for i in 0..<5 {
            for j in 0..<5 {
                if checkP(p,i,j) {
                    students.append((i,j))
                }
            }
        }
        
        // 거리두기를 지키는 경우 : 1
        // 거리두기를 지키지 못하는 경우 : 0
        var val = 1
        
        // students 배열이 비어있을 수 있기에 우선 확인
        if !students.isEmpty {
            // students의 모든 조합을 따져본다. 
            for i in 0..<students.count-1 {
                for j in i+1..<students.count {
                    // 하나라도 해당될 경우 해당 대기실을 거리두기를 지키지 않는 것이기에 break 해준다. 
                    // 맨해튼 거리가 2인 경우
                    if dist(students[i], students[j]) == 2 {
                        // 경로에 알맞게 X가 있는지 확인, 없다면 0 리턴
                        if !checkX(p, students[i], students[j]) {
                            val = 0
                            break
                        }
                    // 맨해튼 거리가 1인 경우 >> 무조건 0 리턴
                    } else if dist(students[i], students[j]) == 1 {
                        val = 0
                        break
                    }
                }
            }
        }
        // 결과 배열에 하나씩 담는다. 
        result.append(val)
    }    
    return result
}

// 맨해튼 거리 구하는 함수
func dist(_ x: (Int,Int), _ y: (Int,Int)) -> Int {
    return abs(x.0 - y.0) + abs(x.1 - y.1)
}

// P의 좌표를 구하는 함수
func checkP(_ arr: [[String]], _ row: Int, _ col: Int) -> Bool {
    return arr[row][col] == "P"
}

// P와 P사이의 X 유무를 구하는 함수
func checkX(_ arr: [[String]], _ x: (Int,Int), _ y: (Int,Int)) -> Bool {
    // 모두 거리가 2인 경우!
    // P들이 가로선상에 놓인 경우
    if x.0 == y.0 {
        for i in x.1+1..<y.1 {
            if arr[x.0][i] != "X" {
                return false
            }
        }
    // P들이 세로선상에 놓인 경우
    } else if x.1 == y.1 {
        for i in x.0+1..<y.0 {
            if arr[i][x.1] != "X" {
                return false
            }
        }
    // P들이 대각선상에 놓인 경우
    } else {
        if arr[x.0][y.1] != "X" || arr[y.0][x.1] != "X" {
            return false
        }
    }
    
    return true
}
