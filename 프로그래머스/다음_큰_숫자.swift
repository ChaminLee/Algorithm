// 기본 풀이
import Foundation

func solution(_ n:Int) -> Int {
    var n = n
    var target = String(n, radix: 2).filter { $0 == "1" }.count 
    while true {
        n += 1
        var next = String(n, radix: 2).filter { $0 == "1" }.count 
        if target == next {
            break
        }
    }
    return n
}

// nonzeroBitCount 사용 풀이
import Foundation

func solution(_ n:Int) -> Int {
    var next = n + 1
    while n.nonzeroBitCount != next.nonzeroBitCount {
        next += 1 
    }
    return next
}
