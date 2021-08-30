class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        // head가 nil일 경우 nil 리턴
        if head?.next == nil {
            return nil
        }
        
        // 새로운 노드
        var new = ListNode(0)
        var node: ListNode? = new
        var left: ListNode? = new
                
        // 새로운 노드에 기존 head 이어 붙이기
        new.next = head
        
        // n+1번만큼 이동
        for _ in 0...n {
            node = node?.next
        }
        
        // node가 nil이 될 때까지, node와 left 이동
        while node != nil {
            node = node?.next
            left = left?.next
        }
                
        // 제거해야하는 값이 left?.next이기에 연결을 끊고 그 다음 노드에 연결해준다. 
        left?.next = left?.next?.next
        
        // 0 포함중이기 때문에 next
        return new.next
    }
}



// 만약 앞에서부터 지우고 싶을 경우 
class Solution {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        if head?.next == nil {
            return nil
        }
        
        var node: ListNode? = head
                        
        for _ in 0..<n-2 {
            node = node?.next
        }
                
        node?.next = node?.next?.next

        return head
    }
}
