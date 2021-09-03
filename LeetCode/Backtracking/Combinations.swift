// Solution with indices
class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var temp = [Int]()
        var answer = [[Int]]()
        
        // backtracking
        func backtrack(_ idx: Int, _ path: inout [Int], _ result: inout [[Int]]) {
            if path.count == k {
                result.append(path)
                return
            }
            
            for i in idx..<n+1 {
                path.append(i)
                backtrack(i+1, &path, &result)
                path.removeLast()
            }
        }
        
        backtrack(1, &temp, &answer)
        
        return answer
    }
}

// Solution with indexing
class Solution {
    func combine(_ n: Int, _ k: Int) -> [[Int]] {
        var temp = [Int]()
        var answer = [[Int]]()
        let arr = Array<Int>(1...n)
        
        // backtracking
        func backtrack(_ idx: Int, _ path: inout [Int], _ result: inout [[Int]]) {
            if path.count == k {
                result.append(path)
                return
            }
            
            for i in idx..<arr.count {
                path.append(arr[i])
                backtrack(i+1, &path, &result)
                path.removeLast()
            }
        }
        
        backtrack(0, &temp, &answer)
        
        return answer
    }
}
