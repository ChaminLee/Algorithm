func solution(_ n:Int) -> Int {
    return fibo(n) % 1234567
}

func fibo(_ n: Int) -> Int {
    var res = [0,1]
    for i in 2...n {
        res.append(res[i - 1] % 1234567 + res[i - 2] % 1234567)
    }
    return res[n]
}
