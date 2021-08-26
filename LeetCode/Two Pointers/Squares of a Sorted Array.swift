// two pointers solution
class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {
        // 결과 배열
        var result = [Int]()
        
        // 좌, 우측 인덱스 세팅
        var left = 0
        var right = nums.count - 1
        
        // 범위를 점점 좁혀나가기
        while left <= right {
            // 각각의 제곱 값
            // 오른차순 정렬이기에 양 끝의 제곱들이 가장 클 수밖에 없음 
            // 즉 밖에서부터 제곱하면서 큰 것들을 더해나가면 됨
            let leftNum = nums[left] * nums[left]
            let rightNum = nums[right] * nums[right]
            
            // 왼쪽이 더 클 경우
            if leftNum > rightNum {
                // 할당하고 다음으로
                result.append(leftNum)
                left += 1
            } else { 
                result.append(rightNum)
                right -= 1
            }
        }
        
        return result.reversed()
    }
}



// simple solution
class Solution {
    func sortedSquares(_ nums: [Int]) -> [Int] {        
        return nums.map { $0 * $0 }.sorted {$0 < $1}
}
