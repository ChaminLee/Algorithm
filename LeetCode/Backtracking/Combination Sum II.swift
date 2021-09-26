class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        // 총합이 target보다 작다면 답이 나올 수 없음
        if candidates.reduce(0,+) < target { return [] }
        
        // 딕셔너리 구조로 개수를 세어주고
        var dict = Dictionary(candidates.map {($0,1)}, uniquingKeysWith: +)
        // 중복 원소들을 제거해준다.
        let candidates = Array(Set(candidates.sorted { $0 < $1 }))
        
        var ans = [[Int]]()
        var temp = [Int]()
        
        // backtracking
        func DFS(_ idx: Int, _ sum: Int, _ tmp: inout [Int], _ result: inout [[Int]]) {
            // 합이 target과 같고, 결과에 없는 배열일 경우 
            if sum == target && !result.contains(tmp) {
                result.append(tmp)
                return
            // 합이 더 커지면 스톱
            } else if sum > target {
                return 
            }
            
            for i in idx..<candidates.count {
                let v = candidates[i]
                // 1개 이상 있어야 사용 가능
                if dict[v]! > 0 {
                    tmp.append(v)
                    // 사용했으니 카운트 -1
                    dict[v]! -= 1
                    DFS(i, sum+v, &tmp, &result)
                    // backtracking
                    // 사용 후 되돌려두기
                    tmp.removeLast()
                    dict[v]! += 1                    
                }
                
            }
        }
        
        DFS(0,0,&temp,&ans)
        
        return ans
    }
}

// 최적화 - dict 미사용, 정렬 이후 이전 값과 동일한지 확인, 값이 커지는 경우를 미리 체크
class Solution {
    func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
        if candidates.reduce(0,+) < target { return [] }
        
        var nums = candidates.sorted()
        var temp = [Int]()
        var result = [[Int]]()
        
        
        dfs(0, nums, target, 0, &temp, &result)
        
        return result
    }
    
    func dfs(_ idx: Int, _ nums: [Int], _ target: Int, _ sum: Int, _ temp: inout [Int], _ result: inout [[Int]]) {
        if sum == target {
            result.append(temp)
            return 
        } 
        
        for i in idx..<nums.count {
            if sum + nums[i] > target {
                return
            }
            
            if i > idx && nums[i] == nums[i-1] { 
                continue
            }
            
            temp.append(nums[i])
            dfs(i+1, nums, target, sum + nums[i], &temp, &result)
            temp.removeLast()
                               
        }
    }
}
