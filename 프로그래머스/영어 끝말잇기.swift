import Foundation

func solution(_ n:Int, _ words:[String]) -> [Int] {
    // 첫 단어
    var unique = [words[0]]
    // 결과 
    var ans = [Int]()
    
    // 첫 번째부터 돌기 
    for i in 1..<words.count {
        // 중복된 단어가 아니고, 앞단어의 뒷글자 == 현재 단어 앞글자일 경우
        if !unique.contains(words[i]) && words[i-1].last! == words[i].first! {
            // 추가
            unique.append(words[i])
        } else {
            // 아닐 경우 번호, 차례 순서대로 저장
            ans.append(i%n + 1) 
            ans.append(i/n + 1)
            break
        }
    }
    // empty일 경우 [0,0]
    return ans == [] ? [0,0] : ans
}
