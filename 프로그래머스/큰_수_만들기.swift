import Foundation

func solution(_ number:String, _ k:Int) -> String {
    // index로 접근하기 위해 하나씩 나눠준다. 
    let numb = number.map { String($0) }
    // 결과를 담을 배열
    var result = [String]()
    // 총 삭제 횟수 카운트
    var count = 0
    // 현재 뽑을 인덱스 
    var idx = 0
    
    // 삭제 카운트 < 가능 삭제 횟수 && 인덱스 < 배열의 총 길이
    while count < k && idx < numb.count{
        // last가 없을 경우 현재 값(numb[idx]) 추가, idx += 1 후 다음 원소로
        // 옵셔널 바인딩 
        guard let last = result.last else {
            result.append(numb[idx])
            idx += 1
            continue
        }
        
        // 선택한 수가 last보다 클 경우 last는 삭제, 삭제 카운트 += 1
        // 현재 값이 더 크다면 last값을 지워 전체 값을 더 크게 만들어 줄 수 있음 
        if last < numb[idx] {
            result.removeLast()
            count += 1
            continue
        } else {
            // last가 선택한 수 보다 크거나 같을 경우 result에 추가 
            result.append(numb[idx])
            idx += 1
        }
    }    
    
    // "1000"의 케이스 > "100"이 됨 
    // 배열을 다 돌았으나 값을 찾지 못한 경우이기에, 뒤에서부터 k만큼 제거해준다. 
    if idx == numb.count {
        return result[0..<result.count - k].joined()
    }
    
    // 삭제를 알맞게 다 한 경우, 나머지 숫자들 그냥 이어붙이기
    if count == k {
        result += numb[idx...]
    }

    // 위 두 경우(idx == numb.count와 count == k)는 겹치는 일이 없음 무조건 하나의 조건에만 해당 
    return result.joined()
}
