//
//  250219.swift
//  swift_cs
//
//  Created by 천성우 on 2/19/25.
//

import Foundation

func programmers_문자열_다루기_기본(_ s:String) -> Bool {
    (s.count == 4 || s.count == 6) && Int(s) != nil
}

func programmers_서울에서_김서방_찾기(_ seoul:[String]) -> String {
    return "김서방은 \(seoul.firstIndex(of: "Kim")!)에 있다"
}

func programmers_수박수박수박수박수박수(_ n:Int) -> String {
    (1...n).map{$0 % 2 == 0 ? "박" : "수"}.reduce("", +)
}

func programmers_문자열을_정수로_바꾸기(_ s:String) -> Int {
    return Int(s)!
}

func programmers_약수의_합(_ n:Int) -> Int {
    n != 0 ? Array(1...n).filter{n % $0 == 0}.reduce(0, +) : 0
}
