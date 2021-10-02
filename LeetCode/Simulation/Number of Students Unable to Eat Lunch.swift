class Solution {
    func countStudents(_ students: [Int], _ sandwiches: [Int]) -> Int {
        // 0 선호, 1 선호하는 학생들의 수 
        var s = [0,0]
        // 채우기
        s[0] += students.filter { $0 == 0 }.count
        s[1] += students.filter { $0 == 1 }.count
        
        // 샌드위치 순서대로, 현재 가져갈 수 있는 학생이 있는지 확인 
        for i in 0..<sandwiches.count {
            let curSand = sandwiches[i]
            // 해당 샌드위치를 선호하는 학생이 아직 있다면
            if s[curSand] > 0 {
                // 해당 학생 제거
                s[curSand] -= 1
            } else {
                // 현재 샌드위치를 가져갈 학생이 없기에 더 이상 순환해도 배급할 수 없음
                return sandwiches.count - i
            }
        }
        
        // 다 제거된 경우
        return 0        
    }
}
