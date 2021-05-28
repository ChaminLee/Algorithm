func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {

    // 2진법으로 변환
    var secrets = arr1.map {String($0, radix:2)}
    var secrets_2 = arr2.map {String($0, radix:2)}
    
    // 자리수 안맞는 것들 맞춰주기 
    func convert(_ arr: inout [String]) {
        for (i,a) in arr.enumerated() {
            if a.count < n {
                arr[i] = String(repeating: "0", count: (n-a.count)) + String(a)
            }
        }
    }
    
    convert(&secrets)
    convert(&secrets_2)

    // 빈 정답 배열 생성
    var answer = Array(repeating: "", count:n)

    // 조건에 따라 정답 배열에 값 할당
    for i in 0..<n {
        let str = secrets[i]
        let str2 = secrets_2[i]
        for j in 0..<n {
            let v1 = str[str.index(str.startIndex, offsetBy: j)]
            let v2 = str2[str2.index(str2.startIndex, offsetBy: j)]
            if String(v1) == "1" || String(v2) == "1" {
                answer[i] += "#"
            } else {
                answer[i] += " "
            }
        }
    }

    
    return answer
}