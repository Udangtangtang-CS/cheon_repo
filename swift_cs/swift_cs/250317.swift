//
//  250317.swift
//  swift_cs
//
//  Created by 천성우 on 3/17/25.
//

import Foundation


// 주어진 숫자를 모두 이용해 target 숫자를 만드는 방법 result를 return 해야한다.

func programmers_타겟_넘버(_ numbers:[Int], _ target:Int) -> Int {
    
    var result = 0
    
    func dfs(_ start: Int, _ sum: Int) {
        if start == numbers.count {
            if sum == target {
                result += 1
            }
            return
        }
        
        dfs(start + 1, sum + numbers[start])
        dfs(start + 1, sum - numbers[start])
    }
    dfs(0, 0)

    return result
}


func programmers_최소직사각형(_ sizes:[[Int]]) -> Int {
    var maxNum = 0
    var minNum = 0

    for i in sizes {
        maxNum = max(maxNum, i.max()!)
        minNum = max(minNum, i.min()!)
    }
    
    return maxNum * minNum
}
