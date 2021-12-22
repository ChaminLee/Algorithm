// Logic
// 1. 1차원 배열과 행 * 열의 값이 같아야 변환이 가능하다. 
// 2. 원하는 "행 x 전체 열 + 열"에 해당하는 1차원 배열의 값이 2차월 배열의 행,열에 해당한다. 
// 3. 공식에 따라 2차원 배열에 값을 채워준다. 


// Soultion 1
class Solution {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        guard m * n == original.count else { 
            return [] 
        }
        
        var mat = Array(repeating: Array(repeating: 0, count: n), count: m)
      
        for i in 0..<m {
            for j in 0..<n {
                mat[i][j] = original[i * n + j]
            }
        }
        
        return mat
    }
}

// Logic
// 1. 1차원 배열과 행 * 열의 값이 같아야 변환이 가능하다.  
// 2. 1차원 배열의 전체 크기를 n의 크기로 순회하며 n 크기 만큼 배열을 잘라낸다. 
// 3. 잘라낸 배열을 공식에 따라 2차원 배열에 값을 채워준다. 


// Soultion 2
class Solution2 {
    func construct2DArray(_ original: [Int], _ m: Int, _ n: Int) -> [[Int]] {
        guard m * n == original.count else { 
            return [] 
        }
        
        var mat = [[Int]]() 
      
        for i in stride(from: 0, to: original.count, by: n) {
            mat.append(Array(original[i..<i+n]))
        }
                
        return mat
    }
}

