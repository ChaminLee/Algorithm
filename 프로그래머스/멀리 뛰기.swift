func solution(_ n:Int) -> Int {
    // 0번째는 안씀
    var jump = [1,1,2]
    // DP로 접근, 1234567을 나눠주는 것은 Int의 최대 크기를 고려해서 저장하기 위한 것
    for i in 1..<n {
        jump.append((jump[i] + jump[i+1]) % 1234567)
    }
    return jump[n]
}
