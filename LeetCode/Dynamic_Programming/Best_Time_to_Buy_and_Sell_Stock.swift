class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        // 현재 최대 수익은 0
        var maxProfits = 0
        // 현재 최소 구입가는 prices[0]
        var buy = prices[0]
        
        // price를 돌며
        for i in 1..<prices.count {
            // 현재 최고 수익과, 현재가 - 구입가를 비교
            maxProfits = max(maxProfits, prices[i] - buy)
            // 구입가는 현재 구입가와 현재가를 비교한다. 
            buy = min(buy, prices[i])
        }
        // 배열이 순차적으로 진행되기에 index를 거스르는 판매행위는 일어나지 않는다.
        
        return maxProfits
    }
}
