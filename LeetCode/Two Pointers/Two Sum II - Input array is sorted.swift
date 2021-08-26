class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        // 양 끝에서 시작
        var left = 0, right = numbers.count - 1
        
        while left < right {
            // 좌, 우측의 합
            let sum = numbers[left] + numbers[right]
            // 합이 타겟과 같다면 각각 +1한 값 리턴
            if sum == target{
                return [left+1, right+1]
            // 합이 더 작다면 left 인덱스를 키워 합 늘리기
            } else if sum < target {
                left += 1
            // 합이 더 크다면 right 인덱스를 낮춰 합 낮축기
            } else {
                right -= 1
            }
        }
        
        return []
    }
}
