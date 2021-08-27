class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var idx = nums.count - 1

        // 뒤에서 부터 처음으로 nums[idx-1] < nums[idx]인 인덱스(idx-1) 구하기 
        while idx > 0 {
            if nums[idx-1] >= nums[idx] {
                idx -= 1
            } else {
                break
            }
        }
        
        // idx == 0 이라는 것은 내림차순 정렬되어있다는 것이기에 그 다음 순열이 없음
        // 뒤집어서 최소값으로 반환
        guard idx != 0 else {
            return nums.reverse()
        }
        
        // idx 조정 및 k 설정(뒤에서 부터)
        idx -= 1
        var k = nums.count - 1
        
        // idx ~ k 중에 처음으로 nums[k] > nums[idx]인 k를 찾는다. 
        while k > idx {
            guard nums[k] <= nums[idx] else {
                break
            } 
            k -= 1
        }
        
        // idx와 k번째 값을 교환
        nums.swapAt(idx,k)
        // idx 이후 (= idx+1)부터 끝까지는 뒤집어서 재할당
        // 이미 내림차순인 것이 검증되었기 때문에 뒤집어야 제일 작은(오름차순)으로 정렬됨 
        nums = nums[0...idx] + Array(nums[idx+1..<nums.count].reversed())
        
    }
}
