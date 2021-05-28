import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    // 편의상 소문자로 표기
    // 등식에서 W = w, H = h
    // 나중에 +2씩 해줌으로써 같게 해준다. 
    var w = 0
    var h = 0

    // h 범위 제한 
    for n in 0..<brown / 2 {
        // (1)번식 정리
        if (2 * yellow + 2 * n * n == n * (brown - 4)) {
            h = n
        }

        // 조건 1번
        if h != 0 || w != 0 {
            w = Int(ceil(Double(yellow / h)))
            // 조건 2번과 3번
            if w >= h && ((2 + w) * (2 + h) == brown + yellow) {
                w += 2
                h += 2
                break
            }   
        }   
    }

    return [w,h]
}