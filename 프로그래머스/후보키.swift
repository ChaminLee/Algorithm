//
//  후보키.swift
//
//  Created by 이차민 on 2021/05/26.
//

import Foundation

func solution(_ relation:[[String]]) -> Int {
    // 열의 개수 = 카테고리 수
    var colCnt = relation[0].count
    
    if colCnt == 1 { return 1 }
    
    var columns = Array<Int>(0..<colCnt)
    var candidateList = [[Int]]()
    
    // 조합 생성
    for i in 1...colCnt {
        candidateList += combinations(columns,i)
    }
    
    // 최종 결과 저장을 위한 키 배열
    var keyList = [[Int]]()
    
    // 조합을 하나씩 돌며
    for candi in candidateList {
        // 중복없는 set 생성
        let candiSet = Set(candi)
        var state = false
        
        // 최소성 체크
        for k in keyList {
            if candiSet.isSuperset(of:k) {
                state = true
                break
            }
        }
        
        // 최소성 조건 미충족시 다음 케이스로 넘어가기 위함
        if state == true {
            continue
        }
        
        // 유일성 체크를 위해 후보키로 인덱싱한 데이터를 구해야한다.
        // 데이터 저장을 위한 배열
        var result = [[String]]()
        
        // 1. 데이터들을 돌며
        for rel in relation {
            var temp = [String]()
            // 2. 원하는 인덱스의 값을 추가해준다.
            for c in candi {
                temp.append(rel[c])
            }
            
            // 3. 중복되지 않는 경우에만 데이터셋에 추가
            if !result.contains(temp) {
                result.append(temp)
            } else {
                break
            }
        }
        // 유일성 체크 ( 내가 골라낸 유니크한 데이터의 개수와 기존 행 개수가 같아야 조건 충족)
        if result.count == relation.count {
            keyList.append(candi)
        }
    }
    return keyList.count
}

//n개중 m를 순서에 상관없이 뽑아야할 조합들을 만들어주는 함수
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
