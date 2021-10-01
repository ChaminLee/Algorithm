// 첫 풀이 
class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var locked = Array(repeating: true, count: rooms.count)
        locked[0] = false
        
        var keys: [Int] = [Int]()
        keys = rooms[0]
        
        // BFS
        while !keys.isEmpty {
            let key = keys.removeFirst()
            locked[key] = false
            
            for k in rooms[key] {
                if locked[k] {
                    keys.append(k)
                }
            }
            
        }
        
        return locked.filter { $0 == false }.count == rooms.count ? true : false
    }
}

// locked를 Set으로 
class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var locked = Set<Int>()
        
        var keys: [Int] = [Int]()
        keys = rooms[0]
        locked.insert(0)
        
        while !keys.isEmpty {
            let key = keys.removeFirst()
            locked.insert(key)
            
            for k in rooms[key] {
                if !locked.contains(k) {
                    keys.append(k)
                }
            }
            
        }
        
        return locked.count == rooms.count ? true : false
    }
}
