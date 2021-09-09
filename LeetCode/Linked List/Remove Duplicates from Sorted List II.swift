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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        // head가 비었는지 확인
        guard let node = head else { return head }
        
        // 유일한 숫자들을 담을 리스트
        var nums = [Int]()
        
        var temp: ListNode? = ListNode(0) // 값을 붙여주기 위함
        var ans: ListNode? = temp // 최종 결과
        var new: ListNode? = node // 유일한 숫자 구할 때
        var target = 0 // 현재 노드 값 저장
        
        // new를 순회
        while new != nil {
            // 현재 노드의 값
            target = new!.val
            
            // 현재 노드의 값을 가지고 있다면 == 중복, 다음 값도 계속 똑같은지 비교하며 이동
            if nums.contains(target) {
                while new!.next != nil && new!.next?.val == target {
                    new = new?.next
                }
                // 삭제
                nums.remove(at: nums.firstIndex(of: target)!)
            } else {
                // 추가
                nums.append(target)
            }
            
            // 다음 이동
            new = new?.next            
        }
    
        // 값 추가 
        for i in 0..<nums.count {
            // 다음 값으로 추가 (현재 0이어서 나중에 0 제거해주면 됨)
            temp?.next = ListNode(nums[i])
            // 다음 이동
            temp = temp?.next            
        }
        
        // 0 빼고 반환
        return ans?.next
    }
}
