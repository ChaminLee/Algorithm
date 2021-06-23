import Foundation

func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    // 1. 우변의 행렬 행 <-> 열 바꾸기
    var arrcol = [[Int]]()
    for j in 0..<arr2[0].count {
        var temp = [Int]()
        for i in 0..<arr2.count {
            temp.append(arr2[i][j])
        }
        arrcol.append(temp)
    }
    
    // 2. 좌변 행렬의 원소와 우변 행렬의 원소 zip하여 곱, 셈 계산
    var res = [[Int]]()
    for l in arr1 {
        var sub = [Int]()
        for r in arrcol {
            sub.append(zip(l,r).map {$0 * $1}.reduce(0,+))
        }
        res.append(sub)
    }
    return res
}
