//
//  250313.swift
//  swift_cs
//
//  Created by 천성우 on 3/12/25.
//

import Foundation

// 항상 ICN 공항에서 출발합니다.
// tickets: 항공권 정보가 담긴 2차원 배열
// return : 방문하는 공항 경로
// tickets의 각 [a, b]는 a에서 b 공항으로 가는 항공권이 있다는 의미
// 주어진 항공권은 모두 사용해야 함
// 만일 가능한 경로가 2개 이상일 경우 알파벳 순서가 앞서는 경로를 return

func programmers_여행경로(_ tickets:[[String]]) -> [String] {
    
    
    let tickets = tickets.sorted { $0[1] < $1[1] }
    var path: [String] = []
    var used = Array(repeating: false, count: tickets.count)
    
    func dfs(_ airport: String) -> Bool {
        path.append(airport)
        
        if path.count == tickets.count + 1 {
            return true
        }
        
        for i in 0..<tickets.count {
            let (start, end) = (tickets[i][0], tickets[i][1])
            if !used[i] && start == airport {
                used[i] = true
                if dfs(end) { return true }
                used[i] = false
            }
        }
        
        path.removeLast()
        return false
    }
    
    dfs("ICN")
    
    return path
    
    
    //    var result: [String] = []
    //    var visited = Array(repeating: false, count: tickets.count)
    //    let ticket = tickets.sorted {$0[1] < $1[1] }
    //
    //    func dfs(startPoint: String) {
    //        if ticket.count == result.count {
    //            result.append(startPoint)
    //            return
    //        }
    //
    //        for i in 0..<ticket.count {
    //            let start = ticket[i][0]
    //            let end = ticket[i][1]
    //
    //            if startPoint == start, !visited[i] {
    //                result.append(start)
    //                visited[i] = true
    //                dfs(startPoint: end)
    //            }
    //        }
    //    }
    //    dfs(startPoint: "ICN")
    //
    //    return result
}
/*
 위 코드의 문제점
 1. 모든 항공권이 사용하지 않고 중간에 종료될 수 있음
 result.count == tickets.count 조건이 잘못됨.
 2. DFS가 올바른 경로를 찾지 못할 가능성이 있음
 result.append(start)를 사용하면 경로가 꼬일 수 있음
 3. 백트래킹이 올바르게 작동하지 않음.
 dfs() 호출 후 visited[i] = false를 해야 하지만, 되돌아올 때 추가했던 start를 제거하는 코드가 빠져 있음.
 */






func programmers_옹알이1(_ babbling:[String]) -> Int {
    var babbling = babbling
    var resultCount: Int = 0

    for i in 0..<babbling.count {
        babbling[i] = babbling[i].replacingOccurrences(of: "aya", with: " ")
        babbling[i] = babbling[i].replacingOccurrences(of: "ye", with: " ")
        babbling[i] = babbling[i].replacingOccurrences(of: "woo", with: " ")
        babbling[i] = babbling[i].replacingOccurrences(of: "ma", with: " ")
        babbling[i] = babbling[i].replacingOccurrences(of: " ", with: "")
    
        if babbling[i].isEmpty {
           resultCount += 1
        }
    }
    return resultCount
}

func programmers_중복된_문자_제거(_ my_string:String) -> String {
    var result: String = ""

    for i in my_string {
        if !result.contains(i) {
            result += String(i)
        }
    }
    
    return result
}
