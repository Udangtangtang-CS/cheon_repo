//
//  250212.swift
//  swift_cs
//
//  Created by 천성우 on 2/12/25.
//

import Foundation


func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func programmers_피자_나눠_먹기_1(_ n:Int) -> Int {
    return (n + 6) / 7
}

func programmers_피자_나눠_먹기_2(_ n:Int) -> Int {
    return lcm(n, 6) / 6
}

func programmers_피자_나눠_먹기_3(_ slice:Int, _ n:Int) -> Int {
    return (n + slice - 1) / slice
}

func programmers_옷가게_할인_받기(_ price:Int) -> Int {
    price >= 500000 ? Int(Double(price) * 0.8) : price >= 300000 ? Int(Double(price) * 0.9) : price >= 100000 ? Int(Double(price) * 0.95) : price
}

func programmers_아이스_아메리카노(_ money:Int) -> [Int] {
    return [money / 5500, money % 5500]
}
