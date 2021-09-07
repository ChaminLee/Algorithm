class Solution {
    func partitionLabels(_ s: String) -> [Int] {
        // 글자의 최대 인덱스를 담을 딕셔너리
        var dict = [Character:Int]()
        // 결과
        var result = [Int]()
        // 배열로 변환
        var words = Array(s)
        
        // 해당 단어의 가장 마지막 인덱스를 담아준다. 
        for i in 0..<words.count {
            dict[words[i]] = i
        }
        
        // 시작, 끝
        var s = 0, e = 0
        
        // 단어를 순회 
        for i in 0..<words.count {
            // 이전 e값과 비교해서 최대값을 저장 
            e = max(e, dict[words[i]]!)
            
            // 현재 인덱스와 e가 같다면, 
            // 예를 들어 a의 인덱스는 1,3,4,9가 있을 수 있는데, a등장시 e는 최댓값인 9로 저장된다. 
            // 즉 여기서 e와 i가 같다는 것은 마지막 a에 도달했다는 것. 
            // 단어를 순회하면서 왔기에 여러 단어들 중 가장 큰 e를 가지는 단어의 i가 등장하여 묶음이 생기는 시점이다. 
            if i == e {
                // 묶음 추가
                result.append(e-s+1)
                // 시작점 = 끝점 + 1 이동
                s = e + 1
            }
        }
        
        return result
    }
}
