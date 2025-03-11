//
//  250311.swift
//  swift_cs
//
//  Created by 천성우 on 3/11/25.
//

import Foundation


func programmers_두_개_뽑아서_더하기(_ numbers:[Int]) -> [Int] {
    var result: Set<Int> = []

    for i in 0..<numbers.count {
        for j in i + 1..<numbers.count {
            result.insert(numbers[i] + numbers[j])
        }
    }
    return result.sorted()
}

func programmers_크기가_작은_부분_문자열(_ t:String, _ p:String) -> Int {
    var counter: Int = 0
    for str in 0...(t.count - p.count) {
        let startIndex = t.index(t.startIndex, offsetBy: str)
        let index = t.index(startIndex, offsetBy: p.count)
        let sub = t[startIndex..<index]

        if Int(sub) ?? 0 <= Int(p) ?? 0 {
            counter += 1
        }
    }
    return counter
}
