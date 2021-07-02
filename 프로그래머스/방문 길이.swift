import Foundation

func solution(_ dirs:String) -> Int {
    // 현위치
    var cur = [0,0]
    // 경로를 저장 
    var paths = [[Int]:[[Int]]]()
    // 총 이동 거리
    var count = 0
    
    // 방향
    for dir in dirs { 
        // 다음 이동 경로를 우선 현위치를 기준으로 설정한다. 
        var next = cur
        
        // 방향에 따른 next 값 변경
        switch dir {            
        case "U":
            next[1] += 1
        case "D":
            next[1] -= 1
        case "L":
            next[0] -= 1
        case "R":
            next[0] += 1
        default:
            break
        }   
        // 그리드를 벗어나지 않도록 해준다. 
        if abs(next[0]) < 6 && abs(next[1]) < 6 {
            // 현위치를 기준으로 한 경로가 있다면
            if let val = paths[cur] {
                // 지나치지 않은 경로여야 함
                if !val.contains(next) {
                    // 새로 추가!
                    paths[cur]!.append(next)
                    // 양방향으로 고려해줘야함
                    if let v = paths[next] {
                        paths[next]!.append(cur)
                    } else {
                        paths[next] = [cur]
                    }
                    count += 1
                }
            // 현위치 기준 경로가 없다면    
            } else {
                // 양방향 추가!
                paths[cur] = [next]
                paths[next] = [cur]
                count += 1
            }
            // 현위치 이동!
            cur = next
        }
    }
    
    return count
}
