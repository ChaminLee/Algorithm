class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var answer = [[Int]]()
        var temp = [Int]()
        
        func backtrack(_ idx: Int, _ path: inout [Int], _ result: inout [[Int]]) {
            // 모든 경우를 다 append
            result.append(path)    
            
            for i in idx..<nums.count {
                path.append(nums[i])
                backtrack(i+1, &path, &result)
                path.removeLast()
            }
        }
        
        backtrack(0, &temp, &answer) 
                
        return answer
    }
}


// 최적화 풀이
class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var list = [[Int]]()
            
        backtracking(0, nums, [], &list)
        
        return Array(list)
    }
    
    func backtracking(_ idx: Int, _ nums: [Int], _ path: [Int], _ result: inout [[Int]]) {
        result.append(path)

        for i in idx..<nums.count {
            backtracking(i+1, nums, path + [nums[i]], &result)
        }
    }
}
