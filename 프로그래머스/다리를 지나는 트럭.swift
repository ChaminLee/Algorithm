// Logic 
// 1. 다리를 지나고 있는 트럭들의 무게 합 + 대기 중인 트럭의 무게가 버틸 수 있는 무게보다 작거나 같다면 대기 중인 트럭을 이동시킨다
// 2. 다리 길이를 고려하여 가장 앞에 온 트럭의 경우 다리를 건넌 트럭에 추가해주고, 그 만큼 무게를 제외해준다. 
// 3. 다리 길이를 유지해야하기 때문에 건너지 못하는 트럭이 있는 경우, 0을 추가해서 다리 길이를 유지한다. 
// 4. 다리를 건넌 트럭의 개수와 기존 트럭의 개수가 같아지면 종료

// Solution
import Foundation

func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var trucks = truck_weights
    let truckCounts = truck_weights.count
    var crossingTrucks = Array(repeating: 0, count: bridge_length)
    var crossedTrucks = [Int]()
    var currentWeight = 0
    var time = 0
    
    while crossedTrucks.count != truckCounts {
        time += 1
        let crossed = crossingTrucks.removeFirst()        
        currentWeight -= crossed
        
        if let firstTruck = trucks.first, weight - currentWeight >= firstTruck {
            let currentTruck = trucks.removeFirst()
            crossingTrucks.append(currentTruck)
            currentWeight += currentTruck
        } else {
            crossingTrucks.append(0)
        }
        
        if crossed != 0 {
            crossedTrucks.append(crossed)            
        }
    }
    
    return time
}
