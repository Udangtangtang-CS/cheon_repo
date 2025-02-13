//
//  250213.swift
//  swift_cs
//
//  Created by 천성우 on 2/13/25.
//

import Foundation

func programmers_배열_뒤집기(_ num_list:[Int]) -> [Int] {
    return num_list.reversed()
}

func programmers_문자열_뒤집기(_ my_string:String) -> String {
    return String(my_string.reversed())
}

func programmers_직각삼각형_출력하기() {
    let n = readLine()!.components(separatedBy: [" "]).map { Int($0)! }
    for i in 1...n[0] {
        print(String(repeating: "*", count: i))
    }
}

func programmers_짝수_홀수_개수(_ num_list:[Int]) -> [Int] {
    return [num_list.filter{ $0 % 2 == 0 }.count, num_list.filter{ $0 % 2 == 1 }.count]
}

func programmers_문자_반복_출력하기(_ my_string:String, _ n:Int) -> String {
    var returnString: String = ""
    my_string.forEach {
        returnString.append(String(repeating: $0, count: n))
    }
    return returnString
}
