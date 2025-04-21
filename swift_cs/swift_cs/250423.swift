//
//  250423.swift
//  swift_cs
//
//  Created by 천성우 on 4/23/25.
//

import Foundation

/// edges는 [a, b]의 형태이며, a → b로 향하는 간선이 있다는 것을 나타냄.
/// return은 생성한 정점의 번호, 도넛 모양 그래프의 수, 막대 모양 그래프의 수, 8자 모양 그래프의 수
func programmers_도넛과_막대_그래프(_ edges:[[Int]]) -> [Int] {
    var graph = [Int : [Int]]()
    var inLine = [Int](repeating: 0, count: 1000001)
    var outLine = [Int](repeating: 0, count: 1000001)
    var maxNode = 0
    var rootNode = 0, donut = 0, stick = 0, eight = 0
    var visitedSet = Set<Int>()
    
    for edge in edges {
        graph[edge[0], default: []].append(edge[1])
        outLine[edge[0]] += 1
        inLine[edge[1]] += 1
        maxNode = max(maxNode, edge[0], edge[1])
    }

    for i in 1...maxNode {
        if inLine[i] == 0 && outLine[i] >= 2 {
            rootNode = i
        }
    }

    for nextNode in graph[rootNode] ?? [] {
        var node = nextNode
        var visited = Set<Int>()
        
        while true {
            if visited.contains(node) { break }
            visited.insert(node)
            visitedSet.insert(node)
            
            if outLine[node] == 0 {
                stick += 1
                break
            } else if outLine[node] == 2 {
                eight += 1
                break
            } else if visited.contains(graph[node]![0]) {
                donut += 1
                break
            } else {
                node = graph[node]![0]
            }
        }
        
    }

    return [rootNode, donut, stick, eight]
}


func programmers_두_큐_합_같게_만들기(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var queue1 = queue1
    var queue2 = queue2
    var queue1Sum = queue1.reduce(0, +)
    var queue2Sum = queue2.reduce(0, +)
    let totalQueue = queue1Sum + queue2Sum
    let maxCount = queue1.count * 3
    var count = 0, i = 0, j = 0
    
    if totalQueue % 2 != 0 { return -1 }
    
    while count <= maxCount {
        if queue1Sum == totalQueue / 2  {
            return count
        } else if queue1Sum > totalQueue / 2 {
            let moveQueue = queue1[i]
            queue1Sum -= moveQueue
            queue2Sum += moveQueue
            queue2.append(moveQueue)
            i += 1
        } else {
            let moveQueue = queue2[j]
            queue1Sum += moveQueue
            queue2Sum -= moveQueue
            queue1.append(moveQueue)
            j += 1
        }
        count += 1
    }
    return -1
}
