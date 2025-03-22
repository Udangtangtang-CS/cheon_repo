//
//  250322.swift
//  swift_cs
//
//  Created by 천성우 on 3/21/25.
//

import Foundation

func programmers_소수_찾기(_ numbers:String) -> Int {
    var stack: [Character] = []

    for c in numbers {
        if !stack.isEmpty && stack.last! == c {
            stack.removeLast()
        } else {
            stack.append(c)
        }
    }

    return stack.isEmpty ? 1 : 0
}

func programmers_카펫(_ brown:Int, _ yellow:Int) -> [Int] {
    var w = 0, h = 0

    let sum = brown + yellow

    for i in 1..<sum {
        if sum % i == 0 {
            w = sum / i
            h = i
        }
        
        if (w - 2) * (h - 2) == yellow {
            break
        }
    }

    return [w, h]
}


func programmers_H_Index(_ citations:[Int]) -> Int {
    var sorted = citations.sorted(by: >)
    let result = sorted.enumerated().filter { index, value in
        return value >= index+1
    }.count

    return result
}

