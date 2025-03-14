//
//  250314.swift
//  swift_cs
//
//  Created by 천성우 on 3/14/25.
//

import Foundation

func programmers_삼총사(_ number:[Int]) -> Int {
    var count = 0
    for num1 in 0..<number.count {
        for num2 in num1+1..<number.count {
            for num3 in num2+1..<number.count {
                if number[num1] + number[num2] + number[num3] == 0 {
                    count += 1
                }
            }
        }
    }
    return count
}

func programmers_배열_조각하기(_ arr:[Int], _ query:[Int]) -> [Int] {
    var result: [Int] = arr
    
    for i in 0..<query.count {
        i % 2 == 0 ? result = Array(result.prefix(through: query[i])) : result.removeFirst(query[i])
    }
    
    return result
}


func programmer_옹알이2(_ babbling:[String]) -> Int {
    
    let possible = ["aya", "ye", "woo", "ma"]
    var resultCount = 0
    
    for babble in babbling {
        var word =  babble
        
        for i in 0..<possible.count {
            word = word.replacingOccurrences(of: possible[i], with: "\(i+1)")
        }
        
        if Int(word) != nil && !(word.contains("11") || word.contains("22") || word.contains("33") || word.contains("44"))  {
            resultCount += 1
        }
    }
    
    return resultCount
}
