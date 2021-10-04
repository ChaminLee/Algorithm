class Solution {
    func processQueries(_ queries: [Int], _ m: Int) -> [Int] {
        // 1부터 m까지 배열
        var p = Array<Int>(1...m)
        // 결과
        var result = [Int]()
        
        // queries를 돌며 확인
        for q in queries {
            // 일치하는 인덱스
            let targetIdx = p.firstIndex(of: q)!
            // 결과에 추가 
            result.append(targetIdx)
            
            // 해당 위치에서 삭제 후
            p.remove(at: targetIdx)
            // 첫 번째에 추가
            p.insert(q, at: 0)
            
        }
        
        return result
    }
}
