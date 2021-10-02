class Solution {
    func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
        var result = Array(repeating: 0, count: num_people)
        var candies = candies
        var idx = 0, candy = 1
        
        while candies > 0 {
            idx %= num_people
            
            if candy > candies {
                result[idx] += candies  
                candies = 0 
                break
            } else {
                result[idx] += candy    
            }
            
            candies -= candy
            candy += 1
            idx += 1            
        }
        
        return result
    }
}
