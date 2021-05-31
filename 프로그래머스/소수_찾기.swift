import Foundation

func solution(_ numbers:String) -> Int {
    // 결과 개수
    var cnt = 0
    // 하나의 원소들로 구분해준다
    let numb = numbers.map {String($0)}
    // 소수는 2이상의 값들에 해당하기에 분류 및 유니크한 숫자들만 걸러냄
  	let combs = Set(combinations(numb,numb.count).filter { Int($0)! > 1}.map {Int($0)!})
    // 해당 숫자들이 소수인지 확인하며 결과 += 1
    for n in Array(combs) {
        if isPrime(n) {
            cnt += 1
        }
    }
    return cnt
}

func combinations(_ elements:[String], _ k: Int) -> Set<String> {
    // 중복되지 않은 값들을 저장하기 위해 반환값은 Set 타입
    
    // 1개씩 뽑고싶을 경우는 유니크한 원소들만 반환하면 된다. 
    if k == 1 {
        return Set(elements) 
    }
    // 1개 미만 뽑을시는 답이 없음.
    if k < 1 {
        return []
    }
    
    // 결과 저장을 위함 
    var result = Set<String>()
    
    // 0 ~ 마지막 원소를 각각 기준으로 하는 조합들을 구해주는 과정 
    for i in 0..<elements.count {
        // 기준이 되는 원소를 미리 저장해둔다.
        let temp = elements[i]
        // 배열도 미리 저장 
        var tempElements = elements
        // 기준이 되는 원소는 배열에서 삭제
        tempElements.remove(at:i)
        
        // 기준 원소를 제외한 배열의 조합을 구하고
        let subCombos = combinations(tempElements, k-1)
        // 위 결과를 기반으로 기준 원소와 각각 합친 값들을 얻는다. 
        let subarray = subCombos.compactMap { temp + $0 }
        // subcombo와 유니크한 subarray를 구하여 더해준다. 
        result = result.union(subCombos)
        result = result.union(Set(subarray))
    }
    return result
}

func isPrime(_ n: Int) -> Bool {
    // 소수일 경우 true, 아니면 false
    var state = true
    // 0,1을 제외하고 2부터 해당 값의 배수인지 확인한다. 
    for i in 2..<n {
        // 배수에 해당된다면 소수의 자격 충족 X 
        if n % i == 0 {
            // false처리해주고 바로 반복문을 종료한다. 
            state = false
            break
        }
    }
    return state
}