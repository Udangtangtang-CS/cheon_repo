//
//  250304.swift
//  swift_cs
//
//  Created by 천성우 on 3/4/25.
//

import Foundation

func programmers_이어_붙인_수(_ num_list:[Int]) -> Int {
    let even = Int(num_list.filter{ $0 % 2 == 0 }.map{String($0)}.reduce("") {$0 + $1})!
    let odd = Int(num_list.filter{ $0 % 2 != 0 }.map{String($0)}.reduce("") {$0 + $1})!
    
    return even + odd
}

func programmers_문자열을_정수로_변환하기(_ n_str:String) -> Int {
    return Int(n_str)!
}

func programmers_정수_부분(_ flo:Double) -> Int {
    return Int(flo)
}

func programmers_마지막_두_원소(_ num_list:[Int]) -> [Int] {
    let last = num_list[num_list.count - 1]
    let prev = num_list[num_list.count - 2]
    return num_list + [last > prev ? last - prev : last * 2]
}
