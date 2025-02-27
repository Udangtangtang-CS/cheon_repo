//
//  250227.swift
//  swift_cs
//
//  Created by 천성우 on 2/27/25.
//

import Foundation


func programmers_팩토리얼(_ n: Int) -> Int {
    var result = 1
    var count = 1
    while count <= n {
        count *= result
        result += 1
    }
    return count == n ? result - 1 : result - 2
}

func programmers_모음_제거(_ my_string: String) -> String {
    return my_string.replacingOccurrences(of: "[aeiouAEIOU]", with: "", options: .regularExpression)
}

func programmers_소인수분해(_ n: Int) -> [Int] {
    var result: [Int] = []
    for i in (2...n) {
        if n % i == 0 && !result.contains(where: { i % $0 == 0}) {
            result.append(i)
        }
    }
    return result
}

func programmers_컨트롤_제트(_ s: String) -> Int {
    var stack: [Int] = []
    
    for value in s.split(separator: " ") {
        if value == "Z" {
            stack.popLast()
        } else if let num = Int(value) {
            stack.append(num)
        }
    }
    
    return stack.reduce(0, +)
}

func programmers_배열_원소의_길이(_ strlist: [String]) -> [Int] {
    return strlist.map { $0.count }
}
