// Logic
// 1. l1, l2를 다음 노드로 이동시키기 위해 var로 선언
// 2. 결과를 연결시켜줄 새로운 시작점 노드 result 생성
// 3. 덧셈시 받아올림을 표현할 변수 생성
// 4. 시작점의 그 다음에 결과가 저장되도록 하기 위해 시작점을 하나 더 갖도록 함
// 5. 링크드리스트에 하나라도 값이 있거나, 받아올림이 있는 경우 계속 진행
// 6. 새로운 노드 생성하여 값을 넣어주고, 이를 다음 노드로 연결
// 7. 나머지와 몫을 이용하여 새로운 값, 받아올림을 결정
// 8. 다음 케이스로 넘어가기 위해 다음 노드로 이동 (가능한 경우에만)

// Solution 
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1, l2 = l2 
        var result = ListNode(0)
        var carry = 0
        var head = result
        
        while l1 != nil || l2 != nil || carry != 0 {
            let new = ListNode(0)
            let value = (l1 == nil ? 0 : l1!.val) + (l2 == nil ? 0 : l2!.val) + carry
            new.val = value % 10 
            carry = value / 10
            result.next = new
            // result = result.next와 같은 역할이라고 봐도 무방, 다음으로 이동시키기 위함
            result = new
            
            l1 = l1 == nil ? l1 : l1?.next
            l2 = l2 == nil ? l2 : l2?.next
        }
        
        return head.next
    }
}
