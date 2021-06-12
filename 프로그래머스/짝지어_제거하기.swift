import Foundation

func solution(_ s:String) -> Int{
    // index 접근하기 위해 배열로 바꿔준다. 
    var str = s.map { String($0) }
    // 결과를 담을 Stack
    var result = [String]()    
    var idx = 0
    
    // 총 길이가 홀수면 어떻게 해도 다 사라지지 못한다.
    if str.count % 2 != 0 { return 0 } 
    // 처음 원소 붙이고 시작
    result.append(str.removeFirst())
    
    // idx가 str의 길이보다 크면 안됨 
    while idx < str.count {
        // result의 마지막 원소가 존재한다면
        if let last = result.last {
            // result의 마지막 원소와 다음에 들어올 원소가 같다면
            if last == str[idx] {
                // result의 마지막 삭제
                result.removeLast()                
            } else {
                // 다르다면 다음 원소 result에 추가
                result.append(str[idx])                
            } 
        } else { 
            // result가 비어있다면 값 추가 
            result.append(str[idx])            
        }
        // 다음 원소로 이동
        idx += 1
    }
    
    // guard문 풀이
//     while idx < str.count {
//         let next = str[idx]
//         guard let last = result.last else { result.append(next); idx += 1; continue } 
        
//         if last == next {
//             result.removeLast()
//         } else {
//             result.append(next)
//         }        
//         idx += 1
//     }
    return result.count == 0 ? 1 : 0
}
