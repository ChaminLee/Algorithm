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

// Solution 1
class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        // 값 변경을 위해 head 복사
        var node = head
        // 카운트
        var cnt = 0, temp = 0
        
        // 배열의 전체 길이 파악
        while node != nil {
            node = node?.next
            cnt += 1
        }
                
        // 다시 복사
        node = head
        
        // 전체 길이의 절반만큼만 이동
        while temp < cnt/2 {
            node = node?.next
            temp += 1
        }
        
        return node
    }
}

// Solution 2
class Solution {
    func middleNode(_ head: ListNode?) -> ListNode? {
        // head가 nil이면 nil 리턴 
        if head == nil {
            return nil
        }
        
        // 하나는 2배속, 하나는 1배속으로 갔을 때, 2배속으로 간 노드가 nil이 되는 순간 1배속으로 간 노드가 중간에 위치하게 됨
        // 2배속으로 이동할 노드
        var fast = head
        // 정배속으로 이동
        var slow = head
        
        // 2배속 노드의 현재, 다음이 nil이 아닐 때
        while fast != nil && fast?.next != nil {
            // 다다음 노드를 붙이기
            fast = fast!.next?.next
            // 다음 노드를 붙이기
            slow = slow?.next
        }
        
        // 1배속 노드를 반환
        return slow
    }
}


