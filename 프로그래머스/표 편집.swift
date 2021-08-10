import Foundation

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var result = Array(repeating:"O", count: n)
    var up = [Int](-1..<n), down = [Int](1...n)
    var stack = [Int]()
    var now = k   
        
    for com in cmd {
        let c = com.components(separatedBy: " ")
        
        switch c[0] {
        case "U":
            for _ in 0..<Int(c[1])! {
                now = up[now]    
            }            
        case "D":
            for _ in 0..<Int(c[1])! {
                now = down[now] 
            } 
        case "C":            
            stack.append(now) 
            // 내려갈 때 스킵할 수 있게
            if up[now] != -1 {
                down[up[now]] = down[now]
            }
            // 올라갈 때 스킵할 수 있게
            if down[now] != n {
                up[down[now]] = up[now]
            }
            
            now = down[now] == n ? up[now] : down[now]
        case "Z":
            if let back = stack.popLast() {
                
                if up[back] != -1 {
                    down[up[back]] = back
                }
                if down[back] != n {
                    up[down[back]] = back
                }
            
            }
        default:
            break
        }
        // print(result, stack)
    }
    
    for s in stack {
        result[s] = "X"
    }
    
    return result.joined(separator: "")
}
