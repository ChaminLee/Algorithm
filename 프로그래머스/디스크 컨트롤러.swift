import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    // 합, 현재 시간
    var sum = 0, time = 0
    // SJF (Shortest Job First)
    // 수행 시간이 같다면, 시작 시간이 빠른 순서대로 정렬 아닐 경우 수행 시간이 짧은 순서대로!
    var SortedJobs = jobs.sorted { $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1] }
    
    while !SortedJobs.isEmpty {
        for i in 0..<SortedJobs.count {
            let startT = SortedJobs[i][0]
            let processT = SortedJobs[i][1]
            
            // 시작 시간이 현재 시간보다 앞서는 경우            
            if startT <= time {
                print(time, startT,processT)
                // 수행 시간 누적
                time += processT
                // 요청부터 종료까지 소요 시간 누적
                sum += (time - startT)
                SortedJobs.remove(at: i)
                break
            }
            
            // 아무런 경우도 위에 해당하지 않아 idx가 끝까지 온 경우 1초 추가
            if i == SortedJobs.count - 1 {
                time += 1
            }
        }
    }
    
    // 평균
    return sum / jobs.count
}
