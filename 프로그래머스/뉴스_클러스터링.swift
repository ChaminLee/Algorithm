import Foundation 

func solution(_ str1:String, _ str2:String) -> Int {
    let newstr1 = prepare(str1)
    let newstr2 = prepare(str2)
    let interCnt = interUnion(newstr1,newstr2)[0]
    let unionCnt = interUnion(newstr1,newstr2)[1]
    
    if unionCnt == 0 && interCnt == 0 {
        return 65536
    } 
    
    return Int(floor((Double(interCnt) / Double(unionCnt)) * 65536))
}
    
func interUnion(_ str1: [String], _ str2: [String]) -> [Int] {
    var dict1 = [String:Int]()
    var dict2 = [String:Int]()
    var minCnt = 0
    var maxCnt = 0
    
    for s in str1 {
        dict1[s, default: 0] += 1
    }
    
    for s in str2 {
        dict2[s, default: 0] += 1
    }
    
    // 1을 기준으로 2에도 있으면 교집합,합집합 추가, 2에 없으면 합집합 추가
    for (k,v) in dict1 {
        if dict2[k] != nil {
            minCnt += min(v, dict2[k]!)
            maxCnt += max(v, dict2[k]!)
        } else {
            maxCnt += v
        }
    }
    // 2에만 있는 것
    for (k,v) in dict2 {
        if dict1[k] == nil {
            maxCnt += v
        }
    }

func prepare(_ str: String) -> [String] {
    let newstr = str.map {String($0.lowercased())}
    var ans = [String]()
    
    for i in 1..<newstr.count {
        if Character(newstr[i-1]).isLetter && Character(newstr[i]).isLetter {
            ans.append(newstr[i-1] + newstr[i])    
        }        
    }
    return ans
}
    return [minCnt,maxCnt]
}