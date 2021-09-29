/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

// recursively
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return checkSymmetric(root?.left, root?.right)
    }
    
    func checkSymmetric(_ nl: TreeNode?, _ nr: TreeNode?) -> Bool {
        // 노드 기준 좌 우 확인 
        guard let nl = nl, let nr = nr else { return nl == nil && nr == nil }
        // 값 비교 
        if nl.val != nr.val { return false }
        // 좌좌 ~ 우우 / 좌우 ~ 우좌 비교 
        return checkSymmetric(nl.left, nr.right) && checkSymmetric(nl.right, nr.left)
    }
}

// iteratively
class Solution {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return false }
        var queue: [TreeNode?] = [root.left, root.right]
        
        while !queue.isEmpty {
            let nodeLeft = queue.removeFirst()
            let nodeRight = queue.removeFirst()
            
            // 빈 노드 패스 
            if nodeLeft == nil && nodeRight == nil { continue }
            
            // 있는 노드 검사후 자식 노드 추가 
            guard let nl = nodeLeft, let nr = nodeRight else { return false }
            
            if nl.val != nr.val {
                return false
            } 
            
            // 비교 : 좌좌 ~ 우우
            queue.append(nl.left)
            queue.append(nr.right)
            // 비교 : 좌우 ~ 우좌      
            queue.append(nl.right)
            queue.append(nr.left)
        }
        
        return true
    }
}
