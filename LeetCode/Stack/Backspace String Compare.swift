class Solution {
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        var stackS = [Character](), stackT = [Character]()

        // 현재 #이면 기존 값 삭제하고 현재 값 추가 X
        for v in s {
            if v == "#" {
                stackS.popLast()
            // 알파벳일 경우 추가
            } else {
                stackS.append(v)
            }
        }
        
        // 현재 #이면 기존 값 삭제하고 현재 값 추가 X
        for v in t {
            if v == "#" {
                stackT.popLast()
            // 알파벳일 경우 추가
            } else {
                stackT.append(v)
            }
        }
                
        // 같은지 비교
        return stackS == stackT
    }
}
