//
//  250225.swift
//  swift_cs
//
//  Created by 천성우 on 2/25/25.
//

import Foundation


func programmers_체육복(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
//    var students = [Int](repeating: 1, count: n)
//    var count = 0
//    
//    lost.forEach { students[$0 - 1] -= 1 }
//    reserve.forEach { students[$0 - 1] += 1 }
//    
//    for i in 0..<n {
//        if students[i] == 0 {
//            if i > 0 && students[i - 1] > 1 {
//                students[i] = 1
//                students[i - 1] = 1
//            } else if i < n - 1 && students[i + 1] > 1 {
//                students[i] = 1
//                students[i + 1] = 1
//            } else {
//                count += 1
//            }
//        }
//    }
//    return n - count
    
    var lostSet = Set(lost)
    var reserveSet = Set(reserve)
    
    let actualLost = lostSet.subtracting(reserveSet)
    var actualReserve = reserveSet.subtracting(lostSet)

    var count = n - actualLost.count

    for student in actualLost.sorted() {
        if actualReserve.contains(student - 1) {
            actualReserve.remove(student - 1)
            count += 1
        } else if actualReserve.contains(student + 1) {
            actualReserve.remove(student + 1)
            count += 1
        }
    }

    return count
}
// lost와 reserve를 set으로 변환하여 여벌 체육복을 가진 학생이 도난을 가질 경우에
// 쉽게 제거할 수 있게 했습니다.


func programmers_실패율(_ N:Int, _ stages:[Int]) -> [Int] {
    var countMap = [Int](repeating: 0, count: N + 2)
    var users = stages.count
    var failStage: [(stage: Int, rate: Double)] = []
    
    for stage in stages {
        if stage <= N {
            countMap[stage] += 1
        }
    }
    
    for i in 1...N {
        if users > 0 {
            let fail = Double(countMap[i]) / Double(users)
            failStage.append((i, fail))
            users -= countMap[i]
        } else {
            failStage.append((i, 0.0))
        }
    }
    
    return failStage.sorted {
        $0.rate == $1.rate ? $0.stage < $1.stage : $0.rate > $1.rate
    }.map { $0.stage }
}

func programmers_크레인_인형뽑기_게임(_ board:[[Int]], _ moves:[Int]) -> Int {
    var stacks = board
    var basket: [Int] = []
    var removedCount = 0

    for move in moves {
        let column = move - 1
        
        for row in 0..<stacks.count {
            if stacks[row][column] != 0 {
                let doll = stacks[row][column]
                stacks[row][column] = 0
                
                if let last = basket.last, last == doll {
                    basket.removeLast()
                    removedCount += 2
                } else {
                    basket.append(doll)
                }
                
                break
            }
        }
    }
    
    return removedCount
}
