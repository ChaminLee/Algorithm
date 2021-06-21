class Solution {
    func minCostClimbingStairs(_ cost: [Int]) -> Int {
        // 각 경우의 최소 cost를 저장하기 위함
        var arr = Array(repeating: 0, count: cost.count)
        // 0,1번째는 바로 저장 
        // 출발선 위치이기에
        arr[0] = cost[0]
        arr[1] = cost[1]
        
        // idx 2부터 시작
        for i in 2..<cost.count {
            // i-1, i-2 중에서 작은 값에서 출발해야 한다. 
            // 최솟값 + 현재값
            // 계속 누적되어 최솟값으로 계산된다.
            arr[i] = min(arr[i-1], arr[i-2]) +  cost[i]
        }
        
        // 마지막 배열 끝 이상으로 나갈 수 있는 경우는 
        // 배열의 총 길이 -1 , -2인 경우이다. 
        // 그렇기에 이 두 개를 비교하여 최솟값을 반환해준다.
        return min(arr[arr.count-1], arr[arr.count-2])
    }
}
