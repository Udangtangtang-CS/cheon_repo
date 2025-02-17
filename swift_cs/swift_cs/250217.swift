//
//  250217.swift
//  swift_cs
//
//  Created by 천성우 on 2/17/25.
//

import Foundation

func programmers_2016(_ a:Int, _ b:Int) -> String {
    let month = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    let day = ["THU", "FRI", "SAT", "SUN", "MON", "TUE", "WED"]
    let input = (month[0..<a-1].reduce(0, +) + b) % 7
    return day[input]
}

func programmers_문자열_내_맘대로_정렬하기(_ strings:[String], _ n:Int) -> [String] {
    return strings.sorted { Array($0)[n] == Array($1)[n] ? $0 < $1 : Array($0)[n] < Array($1)[n] }
}

func programmers_소수_찾기(_ n:Int) -> Int {
    var ary = Array(repeating: true, count: n + 1)
    var count = 0
    
    ary[0] = false
    ary[1] = false
    
    for i in 0...n {
        if ary[i] {
            for j in stride(from: i * 2, through: n, by: i) {
                ary[j] = false
            }
            count += 1
        }
    }
    return count
}

func programmers_시저_암호(_ s:String, _ n:Int) -> String {
    return s.utf8.map {
        var code = Int($0)
        switch code {
        case 65...90:
            code = (code + n - 65) % 26 + 65
        case 97...122:
            code = (code + n - 97) % 26 + 97
        default:
            break
        }
        return String(UnicodeScalar(code)!)
    }.joined()
}

func programmers_이상한_문자_만들기(_ s:String) -> String {
    var ary: [String] = []
    var x = 0
    for i in s {
        x % 2 == 0 ? ary.append(String(i.uppercased())) : ary.append(String(i.lowercased()))
        x += 1
        if i == " " { x = 0 }
    }
    return ary.joined()
}
