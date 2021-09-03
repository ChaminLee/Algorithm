// solution 1 (https://en.wikipedia.org/wiki/Dutch_national_flag_problem)
class Solution {
    func sortColors(_ nums: inout [Int]) {
        // r,w,b 순서를 유지하기 위해 순서대로 나열 
        var r = 0, w = 0, b = nums.count - 1
        
        // w가 b보다 커지면 탈출
        while w <= b {
            // nums[w]가 r일 경우 
            if nums[w] == 0 {
                // r과 스왑
                nums.swapAt(w,r)
                
                // w,r 모두 +1
                w += 1
                r += 1
            // nums[w]가 w(본인)일 경우
            } else if nums[w] == 1 {
                // 다음으로
                w += 1
            // nums[w]가 b일 경우
            } else {
                // b와 스왑
                nums.swapAt(w,b)
                b -= 1
            }
        }                
    }
}


// solution 2
class Solution {
    func sortColors(_ nums: inout [Int]) {
        // 0,1,2 개수를 [0,0,0]에 담아줌
        let colors = nums.reduce(into: [Int](repeating: 0, count:3)) { $0[$1] += 1}
        nums = []
        
        // 빈 배열에 각각의 개수만큼 추가해준다.
        for i in 0..<colors.count {
            nums += Array(repeating: i, count: colors[i])
        }
    }
}      
