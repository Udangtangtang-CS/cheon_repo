//
//  250408.swift
//  swift_cs
//
//  Created by 천성우 on 4/8/25.
//

import Foundation

func programmers_연속_부분_수열_합의_개수(_ elements:[Int]) -> Int {
    var result = Set<Int>()
    let long = elements + elements
    
    for idx in 0..<elements.count{
        var num = 0
        for offset in 0..<elements.count{
            num += long[idx+offset]
            result.insert(num)
        }
        num = 0
    }
    return result.count
}
