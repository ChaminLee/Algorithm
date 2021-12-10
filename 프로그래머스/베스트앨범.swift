// Logic
// 1. 노래의 고유 번호와 재생 횟수를 튜플로 가지도록 한다
// 2. 노래 카테고리 별 최대 재생 횟수에 따라 정렬한다
// 3. 상위권에 속한 카테고리부터 순회하며 이에 속해있는 노래를 2개씩 추출해서 고유 번호를 추가한다. 
// 4. 카테고리에 속한 노래가 2개 미만일 경우 있는 노래 모두 추가 

// Solution
import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var result = [Int]()
    var record = [String: (total: Int, musicInfo: [(uniq: Int, playCount: Int)])]()
    
    for (i,genre) in genres.enumerated() {
        if let count = record[genre]?.total {
            record[genre]?.total = count + plays[i]
            record[genre]?.musicInfo.append((i,plays[i]))
        } else {
            record[genre] = (total: plays[i], musicInfo: [(uniq: i, playCount: plays[i])])
        }        
    }
    
    let sortedRecordKey = record.sorted { $0.value.total > $1.value.total }.map { $0.key }
    
    sortedRecordKey.forEach { key in
        let rankInCategory = record[key]!.musicInfo.sorted { $0.playCount == $1.playCount ? $0.uniq < $1.uniq : $0.playCount > $1.playCount }        
                             print(rankInCategory)
        let maxRange = rankInCategory.count > 1 ? 2 : 1
        for i in 0..<maxRange {
            result.append(rankInCategory[i].uniq)
        }
    }
            
    return result
}
