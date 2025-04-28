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

//    문제요약
//    방향 그래프의 간선 정보 edges가 주어짐
//    그래프에는 다음 3가지 구조가 존재:
//    - 도넛형 그래프: 하나의 사이클
//    - 막대형 그래프: 끝에서 멈추는 선형 구조
//    - 8자형 그래프: 두 개의 사이클이 만나는 구조
//    이 구조들을 연결하는 생성 노드(root node)가 존재함
//    생성 노드를 찾고, 각 구조의 개수를 구하는 문제
//    접근 방식
//
//    1. 그래프 정보 구성
//    간선 정보를 바탕으로 다음을 구성:
//    graph: 인접 리스트
//    inDegree, outDegree: 각 노드의 진입/출력 차수
//    inDegree[i] == 0 && outDegree[i] ≥ 2 조건을 만족하는 노드를 **생성 노드(root)**로 판단
//
//    2. 구조 분류 기준
//    생성 노드에서 출발하여 자식 노드를 따라가며 다음 조건에 따라 구조를 구분
//    outLine[node] == 0, 막대형
//    outLine[node] == 2, 8자형
//    이미 방문한 node에 도달, 도넛형
//
//    in/out-line 분석 + 그래프 탐색으로 구조를 분류
//    효율적인 탐색과 분류 기준 설계


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

//    문제 요약
//
//    두 개의 큐에서 원소를 꺼내 다른 큐로 옮기며 두 큐의 합을 같게 만들어야 함
//    가능한 최소 횟수를 구하는 문제
//    만들 수 없는 경우 -1 반환
//
//    접근 방식
//
//    1. 전체 합 체크
//    두 큐의 합 total이 홀수인 경우, 정확히 나눌 수 없음 → 바로 -1 반환
//
//    2. 투 포인터 방식으로 큐 시뮬레이션
//    queue1, queue2를 배열로 취급하고, 포인터(i, j)를 사용해 양 끝을 관리
//    각 큐의 합(queue1Sum, queue2Sum)을 실시간으로 갱신하면서 조건 판단
//
//    3. 종료 조건
//    연산 횟수는 최대 queue1.count * 3까지만 허용
//
//    removeFirst() 대신 포인터로 큐를 관리하여 시간 복잡도 개선
