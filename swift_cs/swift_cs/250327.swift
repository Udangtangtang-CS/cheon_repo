//
//  250327.swift
//  swift_cs
//
//  Created by 천성우 on 3/27/25.
//

import Foundation


func programmers_이진_변환_반복하기(_ s:String) -> [Int] {
    var convertCount = 0
    var zerosCount = 0
    var target = s
    
    while target != "1" {
        let zeros = target.filter({ $0 == "0" }).count
        zerosCount += zeros
        target = String((target.count - zeros), radix: 2)
        convertCount += 1
    }
    
    return [convertCount, zerosCount]
}


func programmers_멀리_뛰기(_ n:Int) -> Int {
    var first = 0
    var second = 1
    for i in 0..<n {
        let temp = first + second
        first = second
        second = temp % 1234567
    }
    return second
}
