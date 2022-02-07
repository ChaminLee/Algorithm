import Foundation

let persons = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let personA = input[0], personB = input[1]
let relationCount = Int(readLine()!)!
var relation = [[Int]](repeating: [], count: persons)
var visited = Array(repeating: false, count: persons)

for _ in 0..<relationCount {
    let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
    relation[input2[0]-1].append(input2[1])
    relation[input2[1]-1].append(input2[0])
}

func bfs(_ start: Int, _ target: Int) -> Int {
    var willVisit = [Int]()
    var dist = Array(repeating: 0, count: persons)
    willVisit.append(start)
    
    while !willVisit.isEmpty {
        let next = willVisit.removeFirst()
        
        if !visited[next-1] {
            visited[next-1] = true
            willVisit.append(contentsOf: relation[next-1])
            
            for n in relation[next-1] {
                if !visited[n-1] {
                    dist[n-1] = dist[next-1] + 1
                }
            }
        }
    }
    
    return dist[target-1]
}

let result = bfs(personA, personB)
print(result == 0 ? -1 : result)
