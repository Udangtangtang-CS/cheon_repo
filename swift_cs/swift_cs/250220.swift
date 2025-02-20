//
//  250220.swift
//  swift_cs
//
//  Created by 천성우 on 2/20/25.
//

import Foundation

func programmers_자릿수_더하기(_ n:Int) -> Int{
    return String(n).reduce(0, {$0+Int(String($1))!});
}

func programmers_자연수_뒤집어_배열로_만들기(_ n:Int64) -> [Int] {
    return String(n).reversed().map { Int(String($0))! }
}

func programmers_정수_내림차순으로_배치하기(_ n:Int64) -> Int64 {
    return Int64(String(String(n).sorted(by: >)))!
}

func programmers_정수_제곱근_판별(_ n:Int64) -> Int64 {
    let result = Int64(sqrt(Double(n)))
    return result * result == n ? (result + 1) * (result + 1) : -1
}

func programmers_제일_작은_수_제거하기(_ arr:[Int]) -> [Int] {
    let minValue = arr.sorted(by: <)[0]
    return arr.count == 1 ? [-1] : arr.filter{$0 > minValue}
}
