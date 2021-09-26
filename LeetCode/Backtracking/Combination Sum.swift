class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        // 배열의 최소보다 작으면 값을 구할 수 없음 
        if candidates.min()! > target { return [] }
        
        // 최종 값
        var ans = [[Int]]()
        // 경우의 수
        var combs = [Int]()
        
        // Backtracking
        func DFS(_ idx: Int, _ sum: Int, _ comb: inout [Int], _ result: inout [[Int]]) {  
            // 현재 합이 target과 같을 때
            if sum == target {   
                result.append(comb)
                return
            // 더 크다면 버리기
            } else if sum > target {
                return
            }
            
            // idx부터 시작함으로써 0,0,0,0 조합도 가능해짐 
            for i in idx..<candidates.count {
                comb.append(candidates[i])
                DFS(i, sum + candidates[i], &comb, &result)
                // backtracking
                comb.removeLast()
            }
        }
        
        DFS(0,0,&combs,&ans)
        
        return ans
    }
}


// 시간 복잡도 개선
class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        // DFS
        var temp = [Int]()
        var result = [[Int]]() 
        
        dfs(0, candidates, target, 0, &temp, &result)
                
        return result
    }
    
    func dfs(_ idx: Int, _ nums: [Int], _ target: Int, _ sum: Int, _ list: inout [Int], _ result: inout [[Int]]) {
        if sum == target {
            result.append(list)
            return
        } else if sum > target { 
            return 
        }
        
        for i in idx..<nums.count {
            list.append(nums[i])
            dfs(i, nums, target, sum + nums[i], &list, &result)
            list.removeLast()
        }
    }
}
