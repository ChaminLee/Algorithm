import Foundation

func solution(_ dartResult:String) -> Int {
    var totalScore = [Int]()
    var curScore = Array(repeating: "", count: 3)
    var idx = 0
    let options = ["*","#"]
    
    // 1. 판별로 나누기 
    for score in dartResult {
        let value = String(score)
        if score.isNumber {
            curScore[idx] += value
        } else {
            if options.contains(value) {
                
                if idx != 0 {
                    curScore[idx-1] += value
                } else {
                    curScore[0] += value
                }
                
            } else {
                curScore[idx] += value
                idx += 1    
            }
        }
    }

    // 2. 판별 점수 계산
    for i in 0..<curScore.count {
        var num = ""
        
        for v in curScore[i] {
            if v.isNumber {
                num += String(v)
            } else {
                switch v {
                    case "S":
                        totalScore.append(Int(num)!)
                    case "D":
                        totalScore.append(pow(Int(num)!,2))
                    case "T":
                        totalScore.append(pow(Int(num)!,3))
                    case "*":
                        totalScore[i] *= 2
                        if i > 0 {
                            totalScore[i-1] *= 2
                        }
                    case "#":
                        totalScore[i] *= -1
                    default:
                        break
                }
            }
        }
    }
    
    // 3. 총합내기 
    return totalScore.reduce(0,+)
}

func pow(_ a: Int,_ b: Int ) -> Int {
    var res = 1
    for _ in 0..<b {
        res *= a
    }
    return res
}