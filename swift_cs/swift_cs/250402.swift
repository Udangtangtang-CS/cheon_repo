//
//  250402.swift
//  swift_cs
//
//  Created by 천성우 on 4/2/25.
//

import Foundation

func programmers_피로도(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var result = 0
    var visited = [Bool](repeating: false, count: dungeons.count)
    
    func dfs(_ d: Int, _ fatigue: Int) {
        if d > result {
            result = d
        }
        
        for i in 0..<dungeons.count {
            if !visited[i] {
                if fatigue >= dungeons[i][0] {
                    visited[i] = true
                    dfs(d + 1, fatigue - dungeons[i][1])
                    visited[i] = false
                }
            }
        }
    }
    
    dfs(0, k)
    
    return result
}


