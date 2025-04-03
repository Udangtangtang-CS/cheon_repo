//
//  250403.swift
//  swift_cs
//
//  Created by 천성우 on 4/3/25.
//

import Foundation

func programmers_괄호_회전하기(_ s:String) -> Int {
    var str = Array(s)
    var answer = 0
    
    func check(_ array:Array<Character>) -> Bool {
        var checkArray = [Character]()
        let braces: [Character:Character] = ["{":"}", "[":"]", "(":")"]
        
        for i in array {
            if !checkArray.isEmpty && braces[checkArray.last!] == i  {
                checkArray.removeLast()
            } else {
                checkArray.append(i)
            }
        }
        return checkArray.isEmpty
    }
    
    for _ in str {
        str.append(str.removeFirst())
        
        if check(str) {
            answer += 1
        }
    }
    return answer
}
