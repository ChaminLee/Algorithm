// solution - flatMap 
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {  
        let targetNums = matrix.flatMap { $0 }
        var left = 0, right = targetNums.count - 1
        
        while left < right {
            let mid = (left + right) / 2
            
            if targetNums[mid] == target {
                return true
            } else if targetNums[mid] > target {
                right = mid - 1                
            } else {
                left = mid + 1
            }
        }
        
        return targetNums[left] == target ? true : false
    }
}

// solution - matrix
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {  
        // 마지막 행부터 시작
        var row = matrix.count - 1, col = 0
        
        // 범위 내
        while row >= 0 && col < matrix[0].count {            
            if matrix[row][col] == target {
                return true
            // target이 각 행의 첫 번째보다 작을 경우 이전 행으로 이동
            } else if matrix[row][col] > target {
                row -= 1
            // target이 이제 matrix[row][col] < target 인 경우, 해당 행에 있다는 것이기에 col만 증가 
            } else {
                col += 1
            }            
        }
        
        return false
    }
}
