// Logic
// 1. 상하좌우 이동시 현재 위치 수정
// 2. grid를 벗어나지 않는 이동에 한하여 count += 1
// 3. grid를 벗어나면 다음 케이스 이동 및 배열에 count 저장

// Solution 1
class Solution {
    enum direction: Character {
        case left = "L"
        case down = "D"
        case up = "U"
        case right = "R"

        var amount: [Int] {
            switch self {
            case .left:
                return [0,-1]        
            case .right:
                return [0,1]  
            case .down:
                return [1,0]   
            case .up:
                return [-1,0]
            }
        }
    }

    func executeInstructions(_ n: Int, _ startPos: [Int], _ s: String) -> [Int] {
        let instruction = Array(s)                
        var result = [Int]()              
        
        if n == 1 { return Array(repeating: 0, count: s.count) }
        
        for i in 0..<instruction.count {
            var count = 0
            var idx = i
            var cur = startPos
            
            while idx < instruction.count {
                let dir = direction(rawValue: instruction[idx])!
                move(&cur, dir)
                
                if cur[0] > n-1 || cur[0] < 0 || cur[1] > n-1 || cur[1] < 0 {
                    break
                }                
                
                idx += 1
                count += 1
            }
            
            result.append(count)
        }
        
        return result
    }
    
    func move(_ start: inout [Int], _ dir: direction) {
        start = [start[0] + dir.amount[0], start[1] + dir.amount[1]]        
    }
}

// Solution 2
class Solution {
    func executeInstructions(_ n: Int, _ startPos: [Int], _ s: String) -> [Int] {        
        var result = Array(repeating: 0, count: s.count)
        let arr = Array(s)
        
        for i in 0..<s.count {
            var r = startPos[0]
            var c = startPos[1]
            var count = 0
            
            for j in i..<s.count {
                let dir = arr[j]
                
                if dir == "L" {
                    c -= 1
                } else if dir == "R" {
                    c += 1
                } else if dir == "U" {
                    r -= 1
                } else {
                    r += 1
                }
                
                if r < 0 || r > n-1 || c < 0 || c > n-1 {
                    break
                }
                
                count += 1
            }
            
            result[i] = count
        }
    
        return result
    }
}
