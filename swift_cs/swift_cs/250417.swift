//
//  250417.swift
//  swift_cs
//
//  Created by 천성우 on 4/17/25.
//

import Foundation

func programmers_기지국_설치(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    var start = 1
    let coverage = 2 * w + 1

    for station in stations {
        let left = station - w
        if start < left {
            let gap = left - start
            answer += Int(ceil(Double(gap) / Double(coverage)))
        }
        start = station + w + 1
    }

    if start <= n {
        let gap = n - start + 1
        answer += Int(ceil(Double(gap) / Double(coverage)))
    }

    return answer
}
