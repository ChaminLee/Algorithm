// 1
import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int { 
    return dfs(numbers,0,0,target)
}

func dfs(_ nums: [Int], _ index: Int, _ sum: Int, _ target: Int) -> Int {
    // index가 배열의 길이와 같다면, 다 계산한 것임
    if index == nums.count {
        // 계산한 합이 target과 같다면 1 추가 아니면 0
        return sum == target ? 1 : 0
    }
    // 다음 값을 +하는 경우, -하는 경우에서 발생할 수 있는 경우의 수를 더해준다. 
    return dfs(nums, index + 1, sum + nums[index], target) + dfs(nums, index + 1, sum - nums[index], target)
}



// 2
import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    // +첫 원소, -첫 원소 저장
    var result = [numbers[0], -numbers[0]]
    
    // 1번째 원소부터
    for i in 1..<numbers.count {        
        var next = numbers[i]
        var temp = [Int]()
        // 이전 값 + 다음 값, 이전 값 - 다음 값을 배열에 저장
        for res in result {
            temp.append(res + next)
            temp.append(res - next)
        }
        // 배열을 업데이트 
        result = temp
    }
    return result.filter {$0 == target}.count  
}
