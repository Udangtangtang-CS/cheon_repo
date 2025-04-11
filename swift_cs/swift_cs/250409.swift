//
//  250409.swift
//  swift_cs
//
//  Created by 천성우 on 4/09/25.
//

import Foundation

func programmers_숫자_게임(_ a:[Int], _ b:[Int]) -> Int {
    let aSorted = a.sorted()
    let bSorted = b.sorted()
    var aIndex = 0
    var bIndex = 0
    var point = 0

    while aIndex < a.count && bIndex < b.count {
        if bSorted[bIndex] > aSorted[aIndex] {
            point += 1
            aIndex += 1
            bIndex += 1
        } else {
            bIndex += 1
        }
    }
    
    return point
}
