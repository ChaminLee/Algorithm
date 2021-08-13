class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        var res = s.split(separator: " ")
        return res[res.count-1].count
    }
}
