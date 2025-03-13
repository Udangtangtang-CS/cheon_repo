//
//  250313.swift
//  swift_cs
//
//  Created by 천성우 on 3/13/25.
//

import Foundation


func programmers_3진법_뒤집기(_ n:Int) -> Int {
    var str = String(n, radix: 3)
    return Int(String(str.reversed()), radix: 3)!
}
// swift 진수 변환
// init(_: radix: )

func programmers_수열과_구간_쿼리1(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var result = arr
    queries.forEach { ($0[0]...$0[1]).forEach { result[$0] += 1 } }
    
    return result
}

