// 첫 풀이 - 전부 다 이분 
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row = matrix.count, col = matrix[0].count
        
        for i in 0..<row {
            if binarySearch(matrix[i], 0, col-1, target) {
                return true
            }
        }
        
        return false
            
        
    }
    
    func binarySearch(_ mat: [Int], _ left: Int, _ right: Int, _ target: Int) -> Bool {
        var left = left ,right = right
        
        while left < right {
            let mid = (left + right) / 2
            
            if mat[mid] == target {
                return true
            } else if mat[mid] > target {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return mat[left] == target ? true : false
    }
}

// 최적 풀이 - 2차원 행렬 값으로 이분탐색
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        let row = matrix.count, col = matrix[0].count
        // 가장 좌측 하단부터
        var r = row-1, c = 0
        
        while r >= 0 && c < col {
            let val = matrix[r][c]
            
            if val == target {
                 return true                
            } else if val > target {
                r -= 1
            } else {
                c += 1
            }
        }
      // 우측 상단부터도 가능
//         var r = 0, c = col-1
        
//         while r < row && c >= 0 {
//             let val = matrix[r][c]
            
//             if val == target {
//                 return true                
//             } else if val > target {
//                 c -= 1
//             } else {
//                 r += 1
//             }
//         }
        
        return false
            
        
    }
}
