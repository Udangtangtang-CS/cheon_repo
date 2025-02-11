//
//  250211.swift
//  swift_cs
//
//  Created by 천성우 on 2/11/25.
//

import Foundation

func gcd(_ x:Int, _ y:Int) -> Int {
    var a = x
    var b = y
    while b != 0 {
        let r = a % b
        a = b
        b = r
    }
    return a
}
func programmers_분수의_덧셈(_ numer1:Int, _ denom1:Int, _ numer2:Int, _ denom2:Int) -> [Int] {
    let numer = (numer1 * denom2) + (numer2 * denom1)
    let denom = denom1 * denom2
    let d = gcd(numer, denom)
    
    return [numer / d, denom / d]
}

func programmers_배열_두_배_만들기(_ numbers:[Int]) -> [Int] {
    return numbers.map { $0 * 2 }
}

func programmers_중앙값_구하기(_ array:[Int]) -> Int {
    return array.sorted()[array.count / 2]
}

func programmers_최빈값_구하기(_ array:[Int]) -> Int {
    var dictinoary = [Int : Int]()
    var key = 0
    var count = 0
    
    for i in array {
        if dictinoary.contains {$0.key == i} {
            dictinoary[i]! += 1
        } else {
            dictinoary[i] = 1
        }
    }
    
    for (i, j) in dictinoary {
        if j == dictinoary.values.max() {
            count += 1
            key = i
        }
    }
    
    return count == 1 ? key : -1
}

func programmers_짝수는_싫어요(_ n:Int) -> [Int] {
    (0...n).filter { $0 % 2 == 1}
}


