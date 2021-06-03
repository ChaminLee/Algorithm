import Foundation

func solution(_ new_id:String) -> String {
    // 소문자 치환은 먼저 진행 
    var id = new_id.lowercased()
    // 각 단계별 수행
    id = step7(step6(step5(step4(step3(step2(id))))))
    return id
}

func step2(_ id: String) -> String {
    // 숫자,문자,특정 특수문자를 제외하여 선별
    // ** 원소를 하나하나 꺼냈기에 마지막에 joined()로 연결
    let special = ["-","_","."]
    return id.filter {$0.isNumber || $0.isLetter || special.contains(String($0))}.map {String($0)}.joined()
}

func step3(_ id: String) -> String {
    var res = id
    // .을 2개 이상 포함시 .으로 수정 (계속 반복)
    while res.contains("..") {
        res = res.replacingOccurrences(of: "..", with: ".")
    }
    return res
}

func step4(_ id: String) -> String {
    var newid = id
    // index를 구해서 접근해도 되나 빠르게 first / last로 접근!
    if newid.first == "." {
        newid.removeFirst()
    } else if newid.last == "." {
        newid.removeLast()
    }
    return newid
}

func step5(_ id: String) -> String {
    var newid = id
    // 비어있을 경우 대처
    if newid.isEmpty {
        newid += "a"
    }
    return newid
}

func step6(_ id: String) -> String {
    var newid = id
    // 16자리 이상일 경우, 15자리까지만 출력
    // newid.prefix(15) 만으로도 추출 가능
    if newid.count >= 16 {
        let start = newid.index(newid.startIndex, offsetBy:0)
        let end = newid.index(newid.startIndex, offsetBy:14)
        let rnge = start...end
        newid = String(newid[rnge])
    }
    return step4(newid)
}

func step7(_ id: String) -> String {
    var newid = id
    // 길이가 2이하일 경우 계속해서 마지막 원소 추가 
    while newid.count < 3 {
        guard let last = newid.last else {return ""}
        newid += String(last)
    }
    return newid
}