//
//  250320.swift
//  swift_cs
//
//  Created by 천성우 on 3/20/25.
//

import Foundation


func programmers_의상(_ clothes:[[String]]) -> Int {
    var result = 1
    var dic: [String: [String]] = [:]
    
    for cloth in clothes {
        if dic[cloth[1]] == nil {
            dic[cloth[1]] = [cloth[0]]
        } else {
            dic[cloth[1]]!.append(cloth[0])
        }
    }
    
    for d in dic {
        result *= d.value.count + 1
    }
    
    return result - 1
}
