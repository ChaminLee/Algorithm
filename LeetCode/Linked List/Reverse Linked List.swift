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
    func reverseList(_ head: ListNode?) -> ListNode? {
        // 배열의 순서를 뒤집는게 아니라 포인터를 뒤집는 것 
        // 1 > 2 > 3 >
        // < 1 < 2 < 3   이런식
        
        // 뒤집기위한 nil 노드를 하나 만들어줌 
        var pre: ListNode? = nil
        var cur: ListNode? = head
        
        // head는 현재 위치
        // head가 nil이 될 때 끼지, 즉 기존 연결 리스트의 끝으로 가는 경우까지
        while cur != nil {
            // 현재의 다음 값을 pre로 지정해줄 것이기에 미리 현재의 다음 값을 저장해둔다.
            let temp = cur?.next
            // 이전 값을 가리키도록 해준다.  
            cur?.next = pre
            // pre값을 한 칸 다음으로 이동한다
            pre = cur
            // 현재 위치를 다음 값으로 이동
            cur = temp
        }
        
        // 뒤집은 결과 리턴
        return pre
    }
}
