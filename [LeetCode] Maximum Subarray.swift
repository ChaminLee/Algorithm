//
//  [LeetCode] Maximum Subarray.swift
//
//  Created by 이차민 on 2021/05/24.
//

import Foundation

class Solution {
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.count == 1 { return nums[0] }
        
        var cur = nums[0]
        var best = nums[0]
        
        for i in 1..<nums.count {
            cur = max(cur + nums[i], nums[i])
            best = max(best, cur)
        }
        return best
    }
}
