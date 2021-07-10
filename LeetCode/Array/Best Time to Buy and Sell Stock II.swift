class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // 결과값 저장을 위한 변수 생성
        var total = 0
        var cnt = prices.count
        // 배열을 돌면서 저점 매수 고점 매도 진행
        for i in 1..<cnt {
            if prices[i-1] < prices[i] {
                total += prices[i] - prices[i-1]
            }
        }
        return total
    }
}
