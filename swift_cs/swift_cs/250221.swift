//
//  250221.swift
//  swift_cs
//
//  Created by 천성우 on 2/21/25.
//

import Foundation

func programmers_짝수와_홀수(_ num:Int) -> String {
    num % 2 == 0 ? "Even" : "Odd"
}

func programmers_최대공약수와_최소공배수(_ n:Int, _ m:Int) -> [Int] {
    return [gcd(n ,m), lcm(n, m)]
}

func programmers_콜라츠_추측(_ num:Int) -> Int {
    var result = num
    var count = 0
    while result != 1 && count < 500 {
        result = result % 2 == 0 ? even(result) : odd(result)
        count += 1
    }
    return count >= 500 ? -1 : count
}

func odd(_ n: Int) -> Int {
    return n * 3 + 1
}

func even(_ n: Int) -> Int {
    return n / 2
}

func programmers_평균_구하기(_ arr:[Int]) -> Double {
    var sum = 0
    for i in 0..<arr.count{
        sum += arr[i]
    }
    return (Double(sum) / Double(arr.count))
}

func programmers_하샤드_수(_ x:Int) -> Bool {
    return x % String(x).reduce(0, {$0+Int(String($1))!}) == 0
}
