func solution(_ files:[String]) -> [String] {
    // (head, number, index) 순서로 저장 
    var fileOrder = [(String, String, Int)]()        
    
    // index 저장을 위해 enumerated
    for (i,file) in files.enumerated() {
        // head와 number 저장 
        let head = headAndNumber(file).0.lowercased()
        let number = headAndNumber(file).1
        fileOrder.append((head, number, i))
    }
    
    // 정렬 
    let fileOrderSorted = fileOrder.sorted {
        // head가 다를 때
        if $0.0 != $1.0 {
            // head 기준 정렬
            return $0.0 < $1.0
        // head가 같을 때
        } else {
            let numleft = Int($0.1)!
            let numright = Int($1.1)!
            // number가 같을 때 
            if numleft == numright {
                // index 순서로 정렬 
                 return $0.2 < $1.2
            // number가 다를 때
            } else {
                return numleft < numright
            }
        }
        // index만 골라서 indexing
    }.map { files[$0.2] }

    return fileOrderSorted
}

func headAndNumber(_ str: String) -> (String, String) {
    var str2 = str.map {String($0)}
    let spe = [".","-"," "]
    var head = ""
    var number = ""
    var idx = 0 
    
    // 앞에서부터 문자+특수문자만
    for s in str2 {
        if Character(s).isLetter || spe.contains(s) {
            head.append(s)
            idx += 1
        } else {
            break
        }
    }
    // 앞에서부터 숫자만 가져오기 위함
    for s in str2[idx...] {
        if Character(s).isNumber {
            number.append(s)
        } else {
            break
        }
    }
    
    return (head,number)
}
