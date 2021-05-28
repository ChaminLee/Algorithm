import Foundation

func solution(_ expression:String) -> Int64 {
    var numbers = expression.components(separatedBy: ["-","+","*"]).map {Int64($0)!}    
    let symbols = expression.map {Character(String($0))}.filter {!$0.isNumber}
    var orders = comb(Array(Set(symbols).map { String($0) }))
    var result: Int64 = 0
    
    for order in orders {
        var nums = numbers, opers = symbols
        for sym in order {
            let sym = Character(sym)
            while opers.contains(sym) {
                if let idx = opers.firstIndex(of: sym)  {
                    switch sym {
                    case "*":
                        nums[idx] *= nums[idx+1]
                    case "+":
                        nums[idx] += nums[idx+1]
                    case "-":
                        nums[idx] -= nums[idx+1]
                    default:
                        break
                    }
                    nums.remove(at: idx+1)
                    opers.remove(at:idx)                           
                }                                         
            }
        }
        let res = abs(nums[0])
        if res > result {
            result = res
        }
    }
    return result
}