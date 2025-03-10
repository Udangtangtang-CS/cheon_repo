//
//  250310.swift
//  swift_cs
//
//  Created by 천성우 on 3/10/25.
//

import Foundation

func programmers_수열과_구간_쿼리3(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var result = arr
    queries.forEach { result.swapAt($0[0], $0[1]) }
    return result
}

func programmers_수열과_구간_쿼리4(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var result = arr
    
    queries.forEach {
        let (s, e, k) = ($0[0], $0[1], $0[2])
        (s...e).forEach {
            if $0 % k == 0 { result[$0] += 1 }
        }
    }
    
    return result
}

