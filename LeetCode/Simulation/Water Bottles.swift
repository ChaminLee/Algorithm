class Solution {
    func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
        var emptyBottles = 0, bottles = numBottles
        var remain = 0, total = 0
        
        while bottles > 0 {
            total += bottles
            // 빈 병 구하기
            emptyBottles = bottles + remain
            let new = emptyBottles / numExchange
            remain = emptyBottles % numExchange
            bottles = new
        }
        
        return total
    }
}
