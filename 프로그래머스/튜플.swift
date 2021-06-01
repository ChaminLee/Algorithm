import Foundation

func solution(_ s:String) -> [Int] {
	// 결과값을 담을 배열
    var answer = [Int]()

	// 문자열 -> 배열로 변환 중
    var arr = s.components(separatedBy: "}")
        .map {$0.replacingOccurrences(of:"{", with:"")}
        .filter {!$0.isEmpty}
        .map {$0.components(separatedBy: ",")}
        .map {$0.filter {!$0.isEmpty}}
        .sorted() {$0.count < $1.count}

	// 비포함하는 원소만 append
    for elements in arr {
        for element in elements {
            if !answer.contains(Int(element)!) {
                answer.append(Int(element)!)
            }
        }
    }
    

    return answer
}