//
//  250322.swift
//  swift_cs
//
//  Created by 천성우 on 3/21/25.
//

import Foundation

func programmers_소수_찾기(_ numbers:String) -> Int {
    let digits = Array(numbers)
    var visited = Array(repeating: false, count: digits.count)
    var uniqueNumbers = Set<Int>()
    
    func dfs(_ current: String) {
        if !current.isEmpty {
            if let num = Int(current) {
                uniqueNumbers.insert(num)
            }
        }
        
        for i in 0..<digits.count {
            if visited[i] { continue }
            visited[i] = true
            dfs(current + String(digits[i]))
            visited[i] = false
        }
    }
    
    dfs("")
    
    func isPrime(_ num: Int) -> Bool {
        if num < 2 { return false }
        if num == 2 { return true }
        if num % 2 == 0 { return false }
        let limit = Int(Double(num).squareRoot())
        for i in stride(from: 3, through: limit, by: 2) {
            if num % i == 0 { return false }
        }
        return true
    }
    
    return uniqueNumbers.filter { isPrime($0) }.count
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

