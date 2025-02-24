//
//  250224.swift
//  swift_cs
//
//  Created by 천성우 on 2/24/25.
//

import Foundation

func programmers_소수_만들기(_ nums:[Int]) -> Int {
    var answer = 0
    for i in 0..<nums.count-2 {
        for j in i+1..<nums.count-1 {
            for k in j+1..<nums.count {
                if isPrime(num: nums[i] + nums[j] + nums[k]) { answer += 1 }
            }
        }
    }
    return answer
}

func isPrime(num: Int) -> Bool {
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 { return false }
    }
    return true
}

func programmers_예산(_ d:[Int], _ budget:Int) -> Int {
    let resultArray = d.sorted(by: <)
    var money = budget
    var result = 0
    for i in resultArray {
        if i <= money {
            result += 1
            money -= i
        }
    }
    return result
}

func programmers_다트_게임(_ dartResult:String) -> Int {
    // S, D, T -> 1제곱, 2제곱, 3제곱
    // *, 해당 점수와 바로 전에 얻은 점수를 각 2배로 만든다
    // *, 첫 번째 기회에서도 가능하다. 이 경우 해당 점수만 2배가 된다
    // *, 중첩이 가능하다. #옵션과 중첩이 가능하다
    // #, 해당 점수는 마이너스 된다
    
    var scores = dartResult.split(whereSeparator: { !$0.isNumber }).compactMap { Int($0) }
    let letters = dartResult.split(whereSeparator: { $0.isNumber })
    
    for (i, letter) in letters.enumerated() {
        letter.forEach {
            let score = scores[i]
            switch $0 {
            case "D":
                scores[i] = score * score
            case "T":
                scores[i] = score * score * score
            case "*":
                scores[i] = 2 * score
                if i - 1 >= 0 {
                    scores[i - 1] = 2 * scores[i - 1]
                }
            case "#":
                scores[i] = -score
            default:
                break
            }
        }
    }
        
    return scores.reduce(0, +)
}

func programmers_K번째수(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer = [Int]()
    for command in commands {
        let i = command[0]-1
        let j = command[1]-1
        let k = command[2]-1
        let sorted = array[i...j].sorted()
        answer.append(sorted[k])
    }
    return answer
}

func programmers_모의고사(_ answers:[Int]) -> [Int] {
    let arr1 = [1,2,3,4,5]
    let arr2 = [2,1,2,3,2,4,2,5]
    let arr3 = [3,3,1,1,2,2,4,4,5,5]
    var dict = [1:0, 2:0, 3:0]
    
    for (i, answer) in answers.enumerated() {
        dict[1]! += arr1[i % 5] == answer ? 1 : 0
        dict[2]! += arr2[i % 8] == answer ? 1 : 0
        dict[3]! += arr3[i % 10] == answer ? 1 : 0
    }
    
    return dict.filter { $0.value == dict.values.max()! }.map { $0.key }.sorted()
}

