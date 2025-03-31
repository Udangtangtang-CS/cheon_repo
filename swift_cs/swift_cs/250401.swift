//
//  250401.swift
//  swift_cs
//
//  Created by 천성우 on 4/1/25.
//

import Foundation

func programmers_가장_가까운_같은_글자(_ s: String) -> [Int] {
    var position: [Character: Int] = [:]
    var result: [Int] = []
    
    s.enumerated().forEach { (offset, element) in
        if let previousOffset = position[element] {
            result += [offset - previousOffset]
            position[element] = offset
        } else {
            result += [-1]
            position.updateValue(offset, forKey: element)
        }
    }
    
    return result
}

func programmers_귤_고르기(_ k:Int, _ tangerine:[Int]) -> Int {
    var numberDict = [Int:Int]()
    for t in tangerine {
        let number = numberDict[t] ?? 0
        numberDict[t] = number + 1
    }
    let sortedNumbers = numberDict.values.sorted(by: >)
    var number = 0
    var answer = 0
    for item in sortedNumbers.enumerated() {
        let index = item.offset
        let element = item.element
        
        if number + element >= k {
            answer = index + 1
            break
        }
        number += element
    }
    return answer
}
