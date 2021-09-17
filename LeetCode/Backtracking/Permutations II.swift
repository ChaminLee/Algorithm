// 첫 풀이 - 모든 경우의 수 구해서 시간복잡도 높음 
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var answer = [[Int]]()
        var nums = nums.sorted()
        
        permute(0, &nums, &answer)
        
        return answer 
    }
    
    func permute(_ idx: Int, _ nums: inout [Int], _ result: inout [[Int]]) {
        if idx == nums.count - 1 && !result.contains(nums)  {
            result.append(nums)
            return
        }
        
        for i in idx..<nums.count {
            if i != idx && nums[i] == nums[idx] {
                continue
            }
            nums.swapAt(i,idx)
            permute(idx+1, &nums, &result)
            nums.swapAt(i,idx)
        }
    }
}

// 최적화 풀이 - hashmap을 사용하여 중복을 막아준다. 
class Solution {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var answer = [[Int]]()
        var perm = [Int]()
        var nums = nums.sorted()
        var dict = [Int:Int]() 
        
        // 딕셔너리로 유일한 숫자들만 추려냄
        // 개수를 값으로
        for n in nums {
            dict[n, default: 0] += 1
        }
        
        func dfs() {
            // 완성되면 붙이기
            if perm.count == nums.count {
                answer.append(perm)
                return 
            }
            
            // 딕셔너리 내 제한된 갯수로 활용하기에 중복이 발생하지 않음
            for (k,v) in dict {
                // 1개 이상 있어야 함
                if v > 0 {
                    perm.append(k)
                    dict[k]! -= 1
                    
                    // 재귀 돌아주고
                    dfs()
                    
                    // backtrack하기 위해 복원
                    dict[k]! += 1
                    perm.removeLast()
                }
            }
        }
        
        dfs()
        
        return answer 
    }
}
