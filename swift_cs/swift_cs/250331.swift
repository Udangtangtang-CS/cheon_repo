//
//  250331.swift
//  swift_cs
//
//  Created by 천성우 on 3/31/25.
//

import Foundation

func programmers_다음_큰_숫자(_ n:Int) -> Int{
    var answer:Int = n + 1
    
    while n.nonzeroBitCount != answer.nonzeroBitCount {
        answer += 1
    }
    
    return answer
}


func programmers_네트워크(_ n:Int, _ computers:[[Int]]) -> Int {
    var stack: [Int] = []
    var visited: [Bool] = Array(repeating: false, count: n)
    var result = 0
    for i in 0..<n {
        if !visited[i] {
            result += 1
            stack.append(i)
            
            while !stack.isEmpty {
                let top = stack.popLast()!
                visited[top] = true
                
                for j in 0..<n {
                    if j != top && computers[top][j] == 1 && !visited[j] {
                        stack.append(j)
                    }
                }
            }
        }
    }
    
    return result
}
