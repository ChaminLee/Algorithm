import Foundation

func solution(_ numbers:[Int]) -> Int {
    return Array<Int>(0..<10).filter { !numbers.contains($0) }.reduce(0,+)
}
