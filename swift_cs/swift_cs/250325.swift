//
//  250325.swift
//  swift_cs
//
//  Created by 천성우 on 3/25/25.
//

import Foundation

func programmser_다리를_지나는_트럭(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var queue = Array(repeating: 0, count: bridge_length)
    var sum = 0
    var waitTruck = truck_weights
    var result = 0
    
    while !queue.isEmpty{
        result += 1
       
        sum -= queue.removeFirst()
        if let t = waitTruck.first{
            if t + sum <= weight{
                sum += waitTruck.removeFirst()
                queue.append(t)
            }
            else{
                queue.append(0)
            }
        }
        
    }
    return result
}
