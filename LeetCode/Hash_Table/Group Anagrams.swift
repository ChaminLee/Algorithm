class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        // 비어있으면 [[""]] 리턴
        if strs.isEmpty { return [[""]] }
        // 결과값 저장 
        var result = [[String]]()
        
        // 각 단어들을 원소 단위로 정렬해둔다. 
        let words = strs.map { String($0.sorted {$0 < $1}) }
                
        // 유니크한 anagrams를 저장할 딕셔너리
        var dict = [String:[String]]()
        
        // 딕셔너리에 유니크한 anagram과 해당하는 단어 할당
        for i in 0..<words.count { 
            if let val = dict[words[i]] {
                dict[words[i]]!.append(strs[i])
            } else {
                dict[words[i]] = [strs[i]]
            }            
        }
        
        // 해당 값들을 결과 배열에 저장 
        dict.values.map { result.append($0) }
        
        return result
    }
}
