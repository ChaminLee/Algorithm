import Foundation

func solution(_ nums:[Int]) -> Int {
    var count = 0
    for n in combinations(nums,3).map {$0.reduce(0,+)} {
        if isPrime(n) {
            count += 1
        }
    }
    return count
}

// 에라토스테네스의 체
func isPrime(_ num: Int) -> Bool {
    var state = true
    for i in 2..<num {
        if num % i == 0 {
            state = false
            break
        }
    }
    return state
}

func combinations<T>(_ elements: [T], _ k: Int) -> [[T]] {
    // 배열과 추출 개수가 같을 경우 > 그대로 반환
    if elements.count == k {
        return [elements]
    }
    // 추출 개수가 0인 경우 > 빈 배열 반환
    if k == 0 {
        return []
    }
    // 추출 개수가 1인 경우 > 배열의 각 원소들 반환
    if k == 1 {
        return elements.map {[$0]}
    }
    
    // 결과를 저장할 2차원 배열을 생성한다. 
    var result = [[T]]()
    // 원배열의 첫 원소를 제외한 나머지 배열을 저장한다.
    let rest = Array(elements.suffix(from:1))
    // 나머지 배열들을 이용해서 재귀적으로 조합을 구한다. 
    let subcombos = combinations(rest,k-1)
    // 첫 원소 + 나머지 배열들의 재귀적 조합 결과를 하나씩 붙여서 결과에 더한다.
    result += subcombos.map { [elements[0]] + $0 }
    // 첫 원소와 무관하게 나머지 배열들로만 다시 조합을 구해 결과에 더한다. 
    result += combinations(rest,k)
    
    return result
}
