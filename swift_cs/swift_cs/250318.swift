//
//  250318.swift
//  swift_cs
//
//  Created by 천성우 on 3/18/25.
//

import Foundation

// pregresses: 먼저 배포되어야 하는 순서대로 자업의 진도
// speeds: 각 작업의 개발 속도
// return, 각 배포마다 몇 개의 기능이 배포되는지


func programmers_기능개발(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var zipped = zip(progresses, speeds).reversed()
    var sol = [Int]()
    
    while !zipped.isEmpty {
        var release = 0
        
        for i in 0..<zipped.count {
            zipped[i].0 += zipped[i].1
        }
        
        while let last = zipped.last, last.0 >= 100 {
            release += 1
            zipped.removeLast()
        }
        
        if release > 0 {
            sol.append(release)
        }
    }
    return sol
}
