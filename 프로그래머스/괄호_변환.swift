import Foundation

func solution(_ p:String) -> String {
    var ans = ""
    if p.isEmpty { return "" }
    
    var u = divide(p)[0]
    var v = divide(p)[1]
    
    if ucheck(u) {
        return u + solution(v)
    } else {
        ans += "("
        ans += solution(v)
        ans += ")"
        u.removeFirst()
        u.removeLast()
        for str in u {
            ans += str == "(" ? ")" : "("
        }
        return ans
    }
}

func divide(_ p: String) -> [String] {
    var cnt = 0         
    var u = ""
    var v = ""

    for i in 0..<p.count {
        let str = p[p.index(p.startIndex, offsetBy: i)]
        cnt += str == "(" ? 1 : -1
        if cnt == 0 {
            u = String(p.prefix(i+1))
            v = String(p.suffix(p.count-i-1))
            break
        }
    }
    return [u,v]
}

func ucheck(_ u: String) -> Bool {
    var cnt = 0 

    for str in u {      
        if cnt < 0 { return false }
        cnt += str == "(" ? 1 : -1
    }
    return cnt == 0
}