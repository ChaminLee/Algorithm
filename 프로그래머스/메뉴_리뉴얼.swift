import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    // orders 중 가장 긴 배열의 길이를 저장한다. 
    // 나중에 이 보다 큰 course가 오면 그냥 패스하기 위해
    let ordersMaxCount = orders.map {$0.count}.max()!
    // 결과 배열 저장 
    var result = [String]()   
    
    // course의 수로 돈다.
    for c in course {
        // 조합의 등장 횟수를 저장할 딕셔너리
        var dict = [String:Int]()
        
        // orders의 원소 중 가장 긴 것 보다 크면 성립 자체가 안됨
        if c > ordersMaxCount {
            continue
        }

        // orders를 돌면서 조합을 구해준다. 
        for order in orders {
            // 조합을 구하기 이전에 order를 정렬해준다. 
            // ACB ABC는 같은 것이기에 사전 조건을 통일해주는 것이다. (모두 오름차순 정렬)
            let orderSorted = order.map {String($0)}.sorted {$0 < $1}
            // c보다 길이가 크다면 c의 개수로 조합을 구해줘야 한다. 
            if orderSorted.count > c {
                let combs = combinations(orderSorted, c)
                // 키는 다시 문자열 형태로 합쳐서 저장
                let key = combs.map {$0.joined()}
                // 딕셔너리에 저장해준다.
                key.map {
                   dict[$0, default: 0] += 1 
                } 
            // c와 길이가 같다면 조합이 필요하지 않음. 즉 바로 저장
            } else if orderSorted.count == c {
                dict[orderSorted.joined(), default: 0] += 1
            }
        }
        
        // 딕셔너리의 value를 기준으로 내림차순 정렬해준다
        let sortedDict = dict.sorted {$0.1 > $1.1}
        // 가장 첫 원소의 value = max
        let maxVal = sortedDict.first!.1

        // 정렬된 dict를 돌면서 v가 maxVal과 같다면 key를 저장해준다. 
        // 그릭고 최소 두 명에게서 주문 받아야 하는 조건 충족을 위해 v > 1을 넣어준다. 
        for (k,v) in sortedDict {
            if v == maxVal && v > 1 {
                result.append(k)
            }
        }

    } 
    // 결과는 오름차순으로 정렬 
    return result.sorted {$0 < $1}
}


// 자주 사용하는 조합 코드 
func combinations<T>(_ elements: [T], _ k: Int) -> [[T]] {
    if elements.count == k {
        return [elements]
    }
    if k == 0 {
        return []
    } 
    if k == 1 {
        return elements.map { [$0] }
    }
    var result = [[T]]()
    let subarray = Array(elements.suffix(from: 1))

    let subcombos = combinations(subarray, k-1)
    result += subcombos.map { [elements[0]] + $0 }
    result += combinations(subarray, k)
    return result
}
