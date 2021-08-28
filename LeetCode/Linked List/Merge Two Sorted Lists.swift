/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        // l1이 비어있으면 l2, l2가 비어있으면 l1 리턴
        guard let l = l1 else { return l2 }
        guard let r = l2 else { return l1 }
    
        // 값 비교 
        // l이 더 작다면
        if l.val < r.val {
            // l의 첫번째는 킵해두고 l의 다음과 r을 다시 비교
            l.next = mergeTwoLists(l.next, r)
            // l을 기준으로 했기에 l을 리턴
            return l
        // r이 더 작다면
        } else { 
            // r의 첫번째는 킵해두고 r의 다음과 l을 다시 비교
            r.next = mergeTwoLists(l, r.next)
            // r을 기준으로 했기에 r을 리턴
            return r
        }
    }
}
