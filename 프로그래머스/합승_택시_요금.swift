import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
	// 지점의 개수 * 요금 = 즉 모든 지점을 돌 경우 나올 수 있는 값을 최댓값으로 설정
    let maxval = 200 * 100000
    // 최대값으로 이루어진 2차원 배열 생성
    var arr = (0..<n).map {_ in Array(repeating: maxval, count : n)}
    
    // 본인 -> 본인 케이스 최소값으로 
    for i in 0..<n {
        arr[i][i] = 0
    }
    
    // 연결정보 2차원 배열에 반영 
    for f in fares {
    	// 두 지점 간 요금은 무조건 1개 이기에 최솟값 비교하지 않고 값만 할당하면 됨. 
        arr[f[0] - 1][f[1] - 1] = f[2]
        arr[f[1] - 1][f[0] - 1] = f[2]

    }
    
    for i in 0..<n {
        for j in 0..<n {
        	// 위의 케이스 1,2 제외 
            if arr[j][i] == maxval || i==j {
                continue
            } else {
                for k in 0..<n {
                	// 위의 케이스 1 제외
                    if j == k || i == k {
                        continue
                    } else {
                        arr[j][k] = min(arr[j][i]+arr[i][k], arr[j][k])
                    }
                }
            }            
        }
    }
    
    // 이제 비교해야하는 건 "각자 출발" VS "합승을 조금이라도 하는 경우" 
    // 각자 출발 = arr[s-1][a-1] + arr[s-1][b-1]
    // 조금이라도 합승 = arr[s-1][i] + arr[i][a-1] + arr[i][b-1]
    
    var minval = arr[s-1][a-1] + arr[s-1][b-1]
    
    for i in 0..<n {
        let share = arr[s-1][i]
        // 출발지가 A의 집일 경우 0 
        let start = i == a-1 ? 0 : arr[i][a-1] 
        // 출발지가 B의 집일 경우 0         
        let end = i == b-1 ? 0 : arr[i][b-1]
        
        // 두 케이스 비교하여 최소값 할당
        minval = min(minval, share + start + end)
    }

    return minval
}