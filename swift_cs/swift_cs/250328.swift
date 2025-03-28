//
//  250328.swift
//  swift_cs
//
//  Created by 천성우 on 3/28/25.
//

import Foundation

func programmser_부대_복귀(_ n:Int, _ roads:[[Int]], _ sources:[Int], _ destination:Int) -> [Int] {
    
    var map = Array(repeating: [Int](), count: n + 1)
    
    for road in roads {
        map[road[0]].append(road[1])
        map[road[1]].append(road[0])
    }
    
    // 목적지까지의 거리 저장하는 배열
    var distance = Array(repeating: -1, count: n + 1)
    
    // 목적지를 출발점으로 해서 각 지점까지의 거리 bfs로 측정
    func bfs() {
        var q = Queue()
        q.push((destination, 0))
        distance[destination] = 0
        
        while !q.isEmpty {
            let (now, cost) = q.pop()
            for next in map[now] {
                if distance[next] == -1 {
                    q.push((next, cost + 1))
                    distance[next] = cost + 1
                }
            }
        }
    }
    
    bfs()

    return sources.map { distance[$0] }
}

struct Queue {
    var index = 0
    var data = [(Int, Int)]()

    var isEmpty: Bool {
        index == data.count
    }

    mutating func push(_ int: (Int, Int)) {
        data.append(int)
    }

    mutating func pop() -> (Int, Int) {
        defer {
            index += 1
        }
        return data[index]
    }
}
