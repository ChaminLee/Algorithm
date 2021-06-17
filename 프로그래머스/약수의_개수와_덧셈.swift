import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var result = 0
    for n in left...right {
        result += divisor(n).count % 2 == 0 ? n : -n
    }
    return result
}

func divisor(_ n: Int) -> [Int] {
    var result = [Int]()
    for i in 1...n {
        if n % i == 0 {
            result.append(i)
        }
    }
    return result
}
