import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {   
    // 단계별 클리어하지 못한 사용자 수를 저장하기 위한 배열 
    // N+1인 이유는 마지막 단계를 깬 사용자 수를 표시하기 위함 
    var nonClearArr = Array(repeating: 0, count: N+1)
    // (스테이지, 실패율) 저장용도
    var failRate = [(Int,Double)]()
    // 현재 단계까지 클리어하지 못한 사용자 수 (누적) 
    var nonClearUser = 0 
    // 전체 사용자 수
    let stageCnt = stages.count 
    
    // 배열에 단계별로 클리어하지 못한 인원 수 만큼 채워넣기
    for stage in stages {
        nonClearArr[stage-1] += 1
    }
    
    // 
    for i in 0..<N {   
        // 클리어하지 못한 사용자가 없을 경우 
        if nonClearArr[i] == 0 {
            failRate.append((i+1,0.0))
        } else { 
            failRate.append((i+1,(Double(nonClearArr[i]) / Double(stageCnt - nonClearUser))))
        }   
        // 클리어하지 못한 사용자 누적
        nonClearUser += nonClearArr[i]
    }        
    // 실패율이 같을 경우 stage가 빠른 순서대로 정렬해주고, 아닐 경우 실패율을 내림차순으로 하여 정렬해준다. 
    // map으로 stage만 뽑아내기 
    return failRate.sorted { if $0.0 == $1.0 { return $0.0 < $1.0} else {return $0.1 > $1.1}}.map {$0.0}
}