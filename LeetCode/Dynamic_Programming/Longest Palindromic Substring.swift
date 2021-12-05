// Logic 
// 1. String을 indexing하기 위해 우선 배열로 만든다. 
// 2. 가장 긴 palindrome의 정보를 담아줄 (길이, 시작, 끝)의 형태의 변수를 생성한다.
// 3. 짝수/홀수인 경우 케이스를 나누어 찾는다
// 4. 현 위치 기반으로 앞,뒤에 원소가 있는 경우 + 해당 원소들이 같을 경우를 기준으로 판단하여 이동시킨다 
// 5. 최대 길이의 palindrome일 경우 필요 정보 업데이트 


// Solution
class Solution {
    func longestPalindrome(_ s: String) -> String {
        if s.count == 1 { return s }
        
        let words = Array(s)
        var maxPalindrome = (0,0,0)
        var maxCounts = 0
        var start = 0, end = 0
        
        for i in 0..<words.count {
            var oddPalindrome = getPalindrome(words, i, i)                        
            var EvenPalindrome = getPalindrome(words, i, i+1)   
            
            maxPalindrome = oddPalindrome.0 >= EvenPalindrome.0 ? oddPalindrome : EvenPalindrome
            
            if maxPalindrome.0 > maxCounts {
                maxCounts = maxPalindrome.0
                start = maxPalindrome.1
                end = maxPalindrome.2
            }
        }
        
        return String(words[start...end])
    }
    
    func getPalindrome(_ words: [Character], _ l: Int, _ r: Int) -> (Int, Int, Int) {
        var left = l
        var right = r
        
        while left >= 0 && right < words.count && words[left] == words[right] {
            left -= 1 
            right += 1
        }
        
        return (right-left+1, left+1, right-1)
    }
}
