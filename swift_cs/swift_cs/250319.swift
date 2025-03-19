//
//  250319.swift
//  swift_cs
//
//  Created by 천성우 on 3/19/25.
//

import Foundation

func programmer_단어_변환(_ begin:String, _ target:String, _ words:[String]) -> Int {
    guard words.contains(target) else { return 0 }
    
    var visited = Set<String>()
    var minStpes = Int.max
    
    func dfs(_ current: String, _ steps: Int) {
        if current == target {
            minStpes = min(minStpes, steps)
            return
        }
        
        for word in words {
            if !visited.contains(word), checkWord(current, word) {
                visited.insert(word)
                dfs(word, steps + 1)
                visited.remove(word)
            }
        }
    }
    
    dfs(begin, 0)
    
    return minStpes == Int.max ? 0 : minStpes
}

func checkWord(_ word1: String, _ word2: String) -> Bool {
    let wordArray1 = Array(word1)
    let wordArray2 = Array(word2)
    var count = 0
    
    
    for i in 0..<wordArray1.count {
        if wordArray1[i] != wordArray2[i] {
            count += 1
        }
        if count > 1 {
            return false
        }
    }
    
    return count == 1
}
