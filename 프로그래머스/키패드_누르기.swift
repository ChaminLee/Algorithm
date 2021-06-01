import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    // numbers를 queue처럼 쓰고자 변수 선언
    var numbers = numbers
    // 키패드 값 입력
    let N = [["1","4","7","*"],["2","5","8","0"], ["3","6","9","#"]]
    // 키패드 값 : 좌표값을 담을 딕셔너리 객체 생성
    var Ndict = [String:[Int]]()
    
    // 각 값에 좌표값 설정
    for (i,n) in N.enumerated() {
        for (j,v) in n.enumerated() {
            Ndict[v] = [i,j]
        }
    }
    
    var answer = ""
    // 현 위치 설정
    var leftHand = "*"
    var rightHand = "#"
    
    // 하나씩 빼면서 빈 값일 때 까지 
    while !numbers.isEmpty {
        // 값과 좌표를 뽑고
        var value = String(numbers.removeFirst())
        var value_loc = Ndict[value]!
        
        // 1번째줄일 경우 거리 상관없이 무조건 "왼손"으로 
        if N[0].contains(value) {
            answer.append("L")
            leftHand = value
        // 3번째줄일 경우 거리 상관없이 무조건 "왼손"으로            
        } else if N[2].contains(value) {
            answer.append("R")
            rightHand = value
        // 2번째줄일 경우에만 거리로 판단 (다만 거리가 같을 경우 손잡이에 따라 판단)
        } else {
            var l_v = abs(Ndict[leftHand]![0] - value_loc[0]) + abs(Ndict[leftHand]![1] - value_loc[1])
            var r_v = abs(Ndict[rightHand]![0] - value_loc[0]) + abs(Ndict[rightHand]![1] - value_loc[1])
            // 거리 비교 (작은 값의 손을 선택)            
            if l_v < r_v {
                leftHand = value
                answer.append("L")
            } else if l_v > r_v {
                rightHand = value
                answer.append("R")
            } else { 
                // 거리가 같을 경우 손잡이에 따라 결정
                if hand == "right" {
                    answer.append("R")
                    rightHand = value
                } else { 
                    answer.append("L")
                    leftHand = value
                }
                
            }
        }
    }
    return answer
}