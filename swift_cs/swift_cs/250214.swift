//
//  250214.swift
//  swift_cs
//
//  Created by 천성우 on 2/14/25.
//

import Foundation

func programmers_특정_문자_제거하기(_ my_string:String, _ letter:String) -> String {
    return my_string.replacingOccurrences(of: letter, with: "", options: .regularExpression)
}

func programmers_양꼬치(_ n:Int, _ k:Int) -> Int {
    return n * 12000 + k * 2000 - n / 10 * 2000
}

func programmers_배열_자르기(_ numbers:[Int], _ num1:Int, _ num2:Int) -> [Int] {
    return Array(numbers[num1...num2])
}

func programmers_외계행성의_나이(_ age:Int) -> String {
    var returnString = ""
    String(age).forEach {
        returnString.append(String(UnicodeScalar(97 + Int(String($0))!)!))
    }
    return returnString
}

func programmers_진료순서_정하기 (_ emergency:[Int]) -> [Int] {
    let ary = emergency.sorted(by: >)
    var result = Array(repeating: 0, count: emergency.count)
    
    for i in 0 ..< ary.count {
        for j in 0 ..< ary.count {
            if ary[i] == emergency[j] {
                result[j] = i + 1
            }
        }
    }
    return result
}
