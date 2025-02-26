//
//  250226.swift
//  swift_cs
//
//  Created by 천성우 on 2/26/25.
//

import Foundation


func programmers_핸드폰_번호_가리기(_ phone_number:String) -> String {
    return String(repeating: "*", count: phone_number.count - 4) + phone_number.suffix(4)
}

func programmers_행렬의_덧셈(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: arr1[0].count), count: arr2.count)
    for i in 0..<result.count {
        for j in 0..<result[0].count {
            result[i][j] = arr1[i][j] + arr2[i][j]
        }
    }
    return result
}

func programmers_x만큼_간격이_있는_n개의_숫자(_ x:Int, _ n:Int) -> [Int64] {
    return Array(1...n).map { Int64($0 * x) }
}

func programmers_직사각형_별찍기() {
    let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
    let (a, b) = (n[0], n[1])

    for _ in 0..<b {
        print(String(repeating: "*", count: a))
    }
}
