//
//  main.swift
//  swift_cs
//
//  Created by 천성우 on 1/16/25.
//

import Foundation

let clothes = [["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]
var result = 1
var dic: [String: [String]] = [:]

for cloth in clothes {
    if dic[cloth[1]] == nil {
        dic[cloth[1]] = [cloth[0]]
    } else {
        dic[cloth[1]]?.append(cloth[0])
    }
}

for d in dic {
    result *= d.value.count + 1
}

print(result-1)




