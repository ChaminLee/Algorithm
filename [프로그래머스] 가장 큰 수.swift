//
//  [프로그래머스] 가장 큰 수.swift
//
//  Created by 이차민 on 2021/05/24.
//

import Foundation

func solution(_ numbers:[Int]) -> String {
    
    let num = numbers.sorted { Int("\($0)\($1)")! > Int("\($1)\($0)")! }
    if num[0] == 0 {
        return "0"
    }
    return num.map {String($0)}.joined()
}
