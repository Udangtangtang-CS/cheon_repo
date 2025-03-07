//
//  250307.swift
//  swift_cs
//
//  Created by 천성우 on 3/7/25.
//

import Foundation

func programmers_수_조작하기1(_ n:Int, _ control:String) -> Int {
    return control.reduce(n) {
        switch $1 {
        case "w": return $0 + 1
        case "s": return $0 - 1
        case "d": return $0 + 10
        case "a": return $0 - 10
        default: return $0
        }
    }
}

func programmers_수_조작하기2(_ numLog:[Int]) -> String {
    let iniSet: [Int:Character] = [1:"w", -1:"s", 10:"d", -10:"a"]
    return (0...numLog.count-2).map{ String(iniSet[numLog[$0+1] - numLog[$0]]!)}.joined()
}

func programmers_수열과_구간_쿼리2(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    queries.map{ i in
        arr[i[0]...i[1]].filter{ $0 > i[2] }.min() ?? -1
    }
}
