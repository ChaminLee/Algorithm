import Foundation

func solution(_ d:[Int], _ budget:Int) -> Int {
    var cost = d.sorted { $0 < $1 }
    var budget = budget
    
    return cost.filter { 
        budget -= $0
        return budget >= 0
    }.count
    
}
