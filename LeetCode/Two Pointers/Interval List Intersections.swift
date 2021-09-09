// 기존 풀이
class Solution {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        // 둘 중에 하나라도 비어있다면 겹치는 건 없음!
        guard firstList.count != 0 || secondList.count != 0 else { return [] }        
        
        var result = [[Int]]()
        
        // 순회
        for i in 0..<firstList.count {
            for j in 0..<secondList.count {
                let first = firstList[i], second = secondList[j]
            
                // 1번의 시작점이 2번 시작점보다 크고, 2번 종료점보다 작거나
                // 2번의 시작점이 1번 시작점보다 크고, 1번 종료점보다 작은 경우
                if (first[0] >= second[0] && first[0] <= second[1]) || (second[0] >= first[0] && second[0] <= first[1]) {
                    // 최대 시작점, 최소 종료점이 겹치는 구간임
                    let maxX = max(firstList[i][0], secondList[j][0])
                    let minY = min(firstList[i][1], secondList[j][1])   
                    
                    // 시작점은 종료점보다 클 수 없음
                    if maxX <= minY {
                        result.append([maxX, minY])
                    }                    
                }
            }
        }
                
        return result
    }
}

// 최적화 풀이 + while문, 조건문 
class Solution {
    func intervalIntersection(_ firstList: [[Int]], _ secondList: [[Int]]) -> [[Int]] {
        // 둘 중에 하나라도 비어있다면 겹치는 건 없음!
        guard firstList.count != 0 || secondList.count != 0 else { return [] }        
        
        var result = [[Int]]()
        var i = 0, j = 0 
        
        while i < firstList.count && j < secondList.count {
            let first = firstList[i], second = secondList[j]
            
            // 1번의 시작점이 2번 시작점보다 크고, 2번 종료점보다 작거나
            // 2번의 시작점이 1번 시작점보다 크고, 1번 종료점보다 작은 경우
            if (first[0] >= second[0] && first[0] <= second[1]) || (second[0] >= first[0] && second[0] <= first[1])  {
                let maxX = max(first[0], second[0])
                let minY = min(first[1], second[1])
            
                result.append([maxX,minY])
            }
            
            // 시작점은 종료점보다 클 수 없음
            // 첫 번째 종료점이 두 번째 종료점 보다 작다면 첫 번째 배열에서 그 다음으로 이동, 더 작은 걸 다른거로 바꿔서 또 비교
            if first[1] < second[1] {
                i += 1
            } else {
                j += 1
            }
        }
        
                
        return result
    }
}

