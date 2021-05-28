import Foundation

func solution(_ record:[String]) -> [String] {
    // [ID : 이름] 쌍
    var userID = [String:String]()
    // ["상태","ID","이름"]으로 나누기 (퇴장의 경우 "이름" 없음)
    let record = record.map {$0.components(separatedBy: " ")}
    var result = [String]()
    
    // 딕셔너리 키 초기화
    for id in record.map {$0[1]} {
        if !userID.keys.contains(id) { 
            userID[id] = ""
        }
    }
        
    // 최종 이름을 입력
    for rec in record {
        if rec[0] != "Leave" {
            userID[rec[1]] = rec[2]
        }        
    }
    
    // ID에 맞게 이름 변경 및 상태 메시지 출력
    for rec in record {
        if let name = userID[rec[1]] {
            switch rec[0] {
                case "Enter":
                    result.append("\(name)님이 들어왔습니다.")
                case "Leave":
                    result.append("\(name)님이 나갔습니다.")
                default:
                    break
            }
        }        
    }
    
    return result
}