import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    // 문자열 요소를 배열로!
    var info = info.map {$0.replacingOccurrences(of: " and", with: "").components(separatedBy: " ")}
    // db를 딕셔너리로
    var db = [String:[Int]]()
    // 결과
    var ans = [Int]()
    
    // db 구성
    for data in info {
        let lang = [data[0],"-"]
        let dev = [data[1],"-"]
        let lev = [data[2],"-"]
        let food = [data[3],"-"]
        let score = Int(data[4])!
        
        // 모든 케이스를 key value로 저장 
        for l in lang {
            for d in dev {
                for v in lev {
                    for f in food {
                        var datas = "\(l)\(d)\(v)\(f)"
                        if let _ = db[datas] {
                            db[datas]!.append(score)
                        } else {
                            db[datas] = [score]
                        }
                    }
                }
            }
        }
    }
    
    // value를 기준으로 오름차순 정렬 
    for d in db {
        let val = d.value.sorted {$0 < $1}
        db[d.key] = val
    }
    
    // 쿼리를 돌면서
    for q in query {
        // 우선 문자열 전처리
        var t = q.replacingOccurrences(of:" and", with:"").components(separatedBy: " ")
        // key 설정
        var k = "\(t[0])\(t[1])\(t[2])\(t[3])"
        // 점수
        var score = Int(t[4])!
        
        // 키에 대응되는 score 배열
        if let val = db[k] {
            // 이분탐색
            var left = 0 
            var right = val.count - 1 
            var mid = 0
            
            while left <= right {
                mid = (left + right) / 2
                
                if val[mid] < score {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            // left 이후는 기준 score 이상의 점수들임!
            ans.append(val.count - left)
            
        } else {
            // db에 key가 없을 때 
            ans.append(0)
        }
        
    }
    
    return ans
}
