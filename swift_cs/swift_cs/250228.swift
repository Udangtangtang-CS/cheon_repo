//
//  250229.swift
//  swift_cs
//
//  Created by 천성우 on 2/28/25.
//

import Foundation

func programmers_등차수열의_특정한_항만_더하기(_ a:Int, _ d:Int, _ included:[Bool]) -> Int {
    var result: Int = 0
    
    for i in 0..<included.count {
        if included[i] {
            result += a + d * i
        }
    }
    return result
}

func programmers_주사위_게임2(_ a:Int, _ b:Int, _ c:Int) -> Int {
    return a == b && b == c ? ((a+b+c)*(a*a+b*b+c*c)*(a*a*a+b*b*b+c*c*c)) : (a != b && b != c && c != a ? (a+b+c) : ((a+b+c)*(a*a+b*b+c*c)))
}

func programmers_원소들의_곱과_합(_ num_list:[Int]) -> Int {
    return num_list.reduce(1, *) > num_list.reduce(0, +) * num_list.reduce(0, +) ? 0 : 1
}
