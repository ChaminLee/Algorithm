class Solution {
    func addBinary(_ a: String, _ b: String) -> String {        
        // a와 b를 배열로 변환 
        let arrA = Array(a)
        let arrB = Array(b)
        
        // a와 b의 인덱스를 지정 : 뒤에서 부터 진행
        var idxA = arrA.count - 1
        var idxB = arrB.count - 1
        
        // carry : 연산으로 인해 자릿수 증가가 발생했을 때 1로 표현, 아닌 경우 0
        var carry = 0
        
        // 결과 
        var result = ""
        
        // idxA나 idxB가 0 이상이면 진행, 또는 carry가 1이어도 진행(= 마지막으로 자릿수 증가 반영해줘야 할  때)
        while idxA >= 0 || idxB >= 0 || carry > 0 {
            // 초기값
            var temp = carry
            
            // A 처리
            if idxA >= 0 {
                temp += Int(String(arrA[idxA]))!
                idxA -= 1 
            }
            
            // B처리
            if idxB >= 0 {
                temp += Int(String(arrB[idxB]))!
                idxB -= 1
            }
            
            // 결과에 반영 (XOR 연산)
            result = "\(temp % 2)" + result
            
            // 자릿수 증가 있는지 확인 
            carry = temp / 2 
        }
        
        return result
    }
}
