class Solution {
    func queensAttacktheKing(_ queens: [[Int]], _ king: [Int]) -> [[Int]] {
        // 8개의 방향
        var dir = [[-1,-1], [-1,0], [-1,1], [0,-1], [1,0], [0,1], [1,-1], [1,1]]
        // 결과 담을 배열
        var result = [[Int]]()
        
        // 방향을 하나씩 체크
        for d in dir {
            // 해당 방향에 있는 queen들을 담아줄 배열 
            var temp = [[Int]]()
            // 체크
            check(king[0], king[1], d[0], d[1], queens, &temp)
            // 비어있지 않다면 가장 먼저 추가된, 즉 가장 가까운 queen을 해당 라인의 공격가능한 queen으로 선택
            if !temp.isEmpty {
                result.append(temp[0])
            }
        }
                                
        return result
    }
    
    func check(_ r: Int, _ c: Int, _ x: Int, _ y: Int, _ queens: [[Int]], _ result: inout [[Int]]) {
        // 방향 + 이동
        var nr = r + x
        var nc = c + y
        
        // 8x8 체스판
        while (0..<8).contains(nr) && (0..<8).contains(nc) {
            // 이동하는 위치에 퀸이 있는지 확인
            // 있다면 result에 append하고 바로 종료 == 하나만 찾으면 되니까
            if queens.contains([nr,nc]) {
                result.append([nr, nc])    
                break
            }           
            // 매번 이동
            nr += x
            nc += y
        }        
    }
}
