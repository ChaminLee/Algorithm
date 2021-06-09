import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    // 여벌을 가지고 있는 학생 중 잃어버린 경우가 있는 지 먼저 파악해야함
    // 왜냐, 빌려주지 못하고 자기가 입어야하기 때문
    var realReserve = reserve.filter { !lost.contains($0) }
    var realLost = lost.filter { !reserve.contains($0) }
        
    var count = realLost.count
    
    if count == 0 { return n }
    
    for i in 0..<realLost.count {
        for j in 0..<realReserve.count {
            // 이미 빌려준 경우 다음 여벌로 
            if realReserve[j] == 0 {
                continue
            // 잃어버린 학생이 여벌을 갖고 있는 학생의 앞 뒷 번호 학생 중 하나일 경우  
            } else if realLost[i] == realReserve[j] - 1 || realLost[i] == realReserve[j] + 1 {            
                // 빌려준 경우 0으로 표기 
                realReserve[j] = 0
                // 잃어버린 학생 수에서 한 명씩 구제
                count -= 1
                // 다음 잃어버린 학생을 기준으로 
                break
            }
        }
    }
    // 전체 학생 수 - (잃어버린 학생 수 + 커버 가능한 개수)
    return n - count
}
