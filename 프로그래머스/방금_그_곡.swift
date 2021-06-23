func solution(_ m:String, _ musicinfos:[String]) -> String {
    // index접근 가능하도록 배열로 변환 
    let musicinfos = musicinfos.map {$0.components(separatedBy: ",")}
    // # 붙은 것들 변환
    let m = change(m)
    // title, playtime 저장용
    var res = [(String,Int)]()
    
    for info in musicinfos {
        // 실제 재생시간
        let playtime = diff(info[0],info[1])
        // 실제 재생음악
        let music = change(info[3])
        let title = info[2]
        // 배열을 늘릴지 그대로 둘지
        let repeatcnt = playtime / music.count
        let sheet = repeatcnt == 0 ? music : String(repeating: music, count: repeatcnt + 1)
        
        // prefix로 실제 재생시간 만큼 음악을 잘라냄
        if String(sheet.prefix(playtime)).contains(m) {
            res.append((title,playtime))
        }
    }
    
    // 재생시간 먼저 비교 (타이틀은 따라옴)
    return res.max {$0.1 < $1.1}?.0 ?? "(None)"
}

// 시간차이 
func diff(_ s: String, _ e: String) -> Int {
    var s = s.components(separatedBy: ":").map {Int($0)!}
    var e = e.components(separatedBy: ":").map {Int($0)!}
    
    return (e[0] * 60 + e[1]) - (s[0] * 60  + s[1])
}

// # 변환 (소문자로)
func change(_ s: String) -> String{
    let s = s
    return s.replacingOccurrences(of:"C#", with:"c")
        .replacingOccurrences(of: "D#", with: "d")
        .replacingOccurrences(of: "F#", with: "f")
        .replacingOccurrences(of: "G#", with: "g")
        .replacingOccurrences(of: "A#", with: "a")
}
