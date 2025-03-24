//
//  250324.swift
//  swift_cs
//
//  Created by 천성우 on 3/24/25.
//

import Foundation

func programmser_우선순위큐(_ operations:[String]) -> [Int] {
    var queue = [Int]()
    
    for operation in operations {
        let o = operation.split(separator: " ").map{ String($0) }
        
        if o[0] == "I" { queue.append(Int(o[1])!) }
        else if o[0] == "D" && !queue.isEmpty {
            if o[1].contains("-") {
                queue.sort(by: >)
                queue.removeLast()
            } else {
                queue.sort(by: <)
                queue.removeLast()
            }
        }
    }
    
    return queue.isEmpty ? [0, 0] : [queue.max()!, queue.min()!]
}
