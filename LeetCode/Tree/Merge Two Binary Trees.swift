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
class Solution {
    func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
        guard let root1 = root1 else { return root2 }
        guard let root2 = root2 else { return root1 }
        
        // 노드의 값을 root1 기준으로 더해줌
        root1.val += root2.val
        
        // 왼쪽 리프 순환
        root1.left = mergeTrees(root1.left, root2.left)
        // 오른쪽 리프 순환
        root1.right = mergeTrees(root1.right, root2.right)
                
        return root1
    }
}
