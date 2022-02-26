// Logic
// 1. 입력에서 공백으로 구분하고, ","과 ";"를 제거시킨다.
// 2. 첫 심볼을 제외하고, 나머지 변수들에서 변수명과 기호를 분리, 기호는 역으로 정렬
// 3. 두 개를 합쳐서 출력

// Solution
import Foundation

var input = readLine()!.components(separatedBy: " ").map {
    $0.description.replacingOccurrences(of: ",", with: "").replacingOccurrences(of: ";", with: "")
}

let symbol = input.removeFirst()

for input in input {
    var name = input.filter { $0.isLetter }
    var sign = input.filter { !$0.isLetter }.reversed()
    let varSign = String(sign).replacingOccurrences(of: "][", with: "[]")
    let newSign = (symbol + varSign)
    print("\(newSign) \(name);")
}
