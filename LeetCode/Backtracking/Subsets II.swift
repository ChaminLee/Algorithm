// 첫 풀이 - 경우의 수를 다 구하고, 조건에 따라 추가했기에 시간복잡도가 더 높음
class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        var answer = [[Int]]()
        backtracking(0, nums, [], &answer)
        return answer
    }
    
    func backtracking(_ idx: Int, _ nums: [Int], _ path: [Int], _ result: inout [[Int]]) {
        if !result.contains(path) {
            result.append(path)    
        }
        
        for i in idx..<nums.count {
            backtracking(i+1, nums, path + [nums[i]], &result)
        }
    }
}

// 최적화 풀이 - 사전에 조건을 걸어 원하는 값들로만 구성함
class Solution {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var nums = nums.sorted()
        var answer = [[Int]]()
        var temp = [Int]()
        backtracking(0, nums, &temp, &answer)
        return answer
    }
  
    func backtracking(_ idx: Int, _ nums: [Int], _ path: inout [Int], _ result: inout [[Int]]) {
        result.append(path)
        
        for i in idx..<nums.count {
            // 현재 본인인 경우나, 이전과 값이 다를 때 
            if i == idx || nums[i-1] != nums[i] {
                path.append(nums[i])
                backtracking(i+1, nums, &path, &result)
                path.removeLast()
            }            
        }
    }
}
