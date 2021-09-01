/**
 * Definition for a Node.
 * public class Node {
 *     public var val: Int
 *     public var left: Node?
 *     public var right: Node?
 *	   public var next: Node?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *         self.next = nil
 *     }
 * }
 */

class Solution {
    func connect(_ root: Node?) -> Node? {    
        DFS(root)
        return root
    }
    
    func DFS(_ node: Node?) {
        guard let node = node else { return }

        // left 노드가 존재한다면
        if let left = node.left {
            // right를 left의 다음 노드로 
            left.next = node.right
            // DFS
            DFS(left)
        }

        // right 노드가 존재한다면
        if let right = node.right {
            // right의 다음은 아랫 노드의 left임
            // 이분 트리이기 때문에 right 다음은 없음!
            right.next = node.next?.left
            // DFS
            DFS(right)
        }
    }
}
