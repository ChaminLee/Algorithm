// solution 1 - append (모든 경우의 수를 구하고, append하기에 효율성이 좋지 않음)
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var temp = [Int]()
        
        func backtrack(_ idx: Int, _ path: inout [Int], _ answer: inout [[Int]]) {
            if path.count == nums.count {
                // 원소가 겹치지 않는 경우에만 추가 
                if Set(path).count == nums.count {
                    answer.append(path)
                }
                
                return
            }
            
            for i in idx..<nums.count {
                path.append(nums[i])
                backtrack(idx, &path, &answer)
                path.removeLast()
            }
        }
        
        backtrack(0, &temp, &result)
                
        return result
    }
}

// solution 2 - swapAt  (인덱스만 바꾸는 것 이기에, 시간/공간 효율성 더 좋음)   
class Solution {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var numbers = nums
        
        // backtrack
        func backtrack(_ idx: Int, _ path: inout [Int], _ answer: inout [[Int]]) {
            // 길이가 같다면 결과에 붙이기 
            if idx == path.count {                
                answer.append(path)
                return
            }
            
            // 인덱스를 바꿔가며 경우의 수 찾기 
            for i in idx..<path.count {
                path.swapAt(idx,i)
                backtrack(idx+1, &path, &answer)
                path.swapAt(idx,i)
            }
        }
        
        backtrack(0, &numbers, &result)
                
        return result
    }
}
