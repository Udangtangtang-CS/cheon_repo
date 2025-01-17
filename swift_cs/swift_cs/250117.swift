//
//  250117.swift
//  swift_cs
//
//  Created by 천성우 on 1/17/25.
//

func programmers_문자열_섞기(_ str1:String, _ str2:String) -> String {
    var str = ""
    for i in 0..<str1.count{
        str.append(Array(str1)[i])
        str.append(Array(str2)[i])
    }
    return str
}

func programmers_문자_리스트를_문자열로_변환하기(_ arr:[String]) -> String {
    return arr.map{$0}.joined()
}

func programmers_문자열_곱하기(_ my_string:String, _ k:Int) -> String {
    return String(repeating: my_string, count: k)
}

func programmers_더_크게_합치기(_ a:Int, _ b:Int) -> Int {
    return Int(String(a) + String(b))! > Int(String(b) + String(a))! ? Int(String(a) + String(b))! : Int(String(b) + String(a))!
}

func programmers_두_수의_연산값_비교하기(_ a:Int, _ b:Int) -> Int {
    let c = Int("\(a)\(b)")!, d = 2 * a * b
    return c < d ? d : c
}
