class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxsub = 0, sub = [Character]()
        s.map { 
            if sub.contains($0) {
                sub.removeSubrange(0...sub.firstIndex(of: $0)!)
            } 
            sub.append($0)
            maxsub = max(maxsub, sub.count)
        }
        return maxsub
    }
}
