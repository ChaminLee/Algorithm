class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        // 개수가 2개 이하인 경우는 답이 나올 수 없음 
        guard nums.count > 2 else { 
            return [] 
        }
        
        // 유니크한 결과를 담을 Set
        var results = Set<[Int]>()
        // 유니크한 값을 찾기 위해 기존에 값 정렬
        let sortedNums = nums.sorted { $0 < $1 }
        
        // 하나씩 돌면서
        for i in 0..<sortedNums.count {
            // i번째, i+1번째, 총 길이 - 1번째를 구하기 위해 미리 값 설정
            var left = i + 1
            var right = sortedNums.count - 1
            
            // 이분탐색처럼 진행
            while left < right {
                // 숫자 조합
                let combs = [sortedNums[i], sortedNums[left], sortedNums[right]]
                // 조합의 합
                let sumOfNums = combs.reduce(0,+)
                
                // 조합의 합이 0이면 결과 Set에 추가
                if sumOfNums == 0 {
                    results.insert(combs)
                    // 다음 값 찾기 위해 i는 고정하고 left, right 각각 안쪽으로 이동
                    left += 1
                    right -= 1
                // 조합의 합이 0보다 크다면 right를 좌측으로 한 칸 당겨서 값이 작아지도록 함
                // 배열이 현재 오름차순이기 때문에 가장 오른쪽 값을 왼쪽으로 이동시켜 합이 작아지도록 한다. 
                } else if sumOfNums > 0 {
                    right -= 1
                // 조합의 합이 0보다 작을 경우, left를 한 칸 우측으로 당겨서 값이 커지도록 한다. 
                // 마찬가지로 배열이 오름차순이기 때문에 왼쪽 값을 우측으로 한 칸 이동 시켜서 합이 커지도록 만든다. 
                } else {
                    left += 1
                }
            }
        }
                
        return Array(results)
    }
}


// Soultion for TLE(Time Limit Exceeded (조건 3개 추가)
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        if nums.count < 3 { return [] }
        
        let nums = nums.sorted { $0 < $1 }
        var result = Set<[Int]>()
        
        
        for i in 0..<nums.count {
            // (+) 계속 양수면 0을 만들 수 없음
            if nums[i] > 0 {
                break
            }
            
            // (+) 시작점이 이전 값과 같으면 비교하는 의미가 없음 
            guard i == 0 || nums[i-1] != nums[i] else { 
                continue
            }
            
            var left = i, mid = left + 1, right = nums.count - 1
            
            while mid < right {
                let element = [nums[left], nums[mid], nums[right]]
                let sum = element.reduce(0,+)

                if sum == 0 {
                    result.insert(element)
                    mid += 1
                    right -= 1
                    
                    // (+) 이전 값과 같다면 한 번 더 이동 (반복)
                    while mid < right && nums[mid] == nums[mid-1] { mid += 1 }
                    while mid < right && nums[right] == nums[right+1] { right -= 1 }
                } else {
                    sum > 0 ? (right -= 1) : (mid += 1)
                }
            }
        }
                
        return Array(result)
    }
}
