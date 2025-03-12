//
//  main.swift
//  swift_cs
//
//  Created by 천성우 on 1/16/25.
//

import Foundation

let says: String = "people"
var result: String = ""

for i in says {
    if !result.contains(i) {
        result += String(i)
    }
}

print(result)

