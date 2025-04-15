//
//  250416.swift
//  swift_cs
//
//  Created by 천성우 on 4/16/25.
//

import Foundation

func programmers_조이스틱(_ name:String) -> Int {
    let nameArray = Array(name)
    let length = nameArray.count

    var answer = nameArray.reduce(0) {
        $0 + min(Int($1.asciiValue! - 65), Int(91 - $1.asciiValue!))
    }

    var move = length - 1

    for i in 0..<length {
        var nextIndex = i + 1
        
        while nextIndex < length && nameArray[nextIndex] == "A" {
            nextIndex += 1
        }
        

        let case1 = i + i + (length - nextIndex)
        let case2 = i + (length - nextIndex) * 2
        move = min(move, min(case1, case2))
    }

    return answer + move
}
