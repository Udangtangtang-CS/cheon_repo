//
//  250326.swift
//  swift_cs
//
//  Created by 천성우 on 3/26/25.
//

import Foundation


func programmers_가장_먼_노드(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = Array(repeating: [Int()], count: n + 1)
    var queue = [Int]()
    var visited = [Bool](repeating: false, count: n + 1)
    var distance = [Int](repeating: 0, count: n + 1)
    
    for vertex in edge {
        graph[vertex[0]].append(vertex[1])
        graph[vertex[1]].append(vertex[0])
    }
    
    queue.append(1)
    visited[1] = true
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        for i in graph[node] {
            if !visited[i] {
                visited[i] = true
                queue.append(i)
                distance[i] = distance[node] + 1
            }
        }
    }
    
    let maxDistance = distance.max()!
    return distance.filter { $0 == maxDistance }.count
}


// 문제, 결과 값 return 하지만 케이스 7, 8, 9에서 시간 초과
// return을 할 때 distance.max가 여러번 반복 호출되는 것이 문제일 것이라고 판단
// max()는 distance 배열을 한 번 순회하면서 최대값을 찾는 O(n) 연산을 수행합니다.
// 하지만 filter 내부에서 distance.max()!를 모든 요소에 대해 반복적으로 호출하므로, 최악의 경우 O(n²)의 복잡도를 가지게 됩니다.


// 원인, distance.max()!가 filter 내부에서 여러 번 호출되므로 성능 저하 야기
// max() 연산이 O(n), filter연산이 O(n) 이를 반복 호출하기 때문에 최악의 경우 O(n²)


// 해결, max를 미리 호출하여 최댓값을 한 번만 저장한 후, filter에서 해당 변수를 사용하여 성능 개선

// 초기의 코드
//func programmers_가장_먼_노드(_ n:Int, _ edge:[[Int]]) -> Int {
//    var graph = Array(repeating: [Int()], count: n + 1)
//    var queue = [Int]()
//    var visited = [Bool](repeating: false, count: n + 1)
//    var distance = [Int](repeating: 0, count: n + 1)
//    
//    for vertex in edge {
//        graph[vertex[0]].append(vertex[1])
//        graph[vertex[1]].append(vertex[0])
//    }
//    
//    queue.append(1)
//    visited[1] = true
//    
//    while !queue.isEmpty {
//        let node = queue.removeFirst()
//        for i in graph[node] {
//            if !visited[i] {
//                visited[i] = true
//                queue.append(i)
//                distance[i] = distance[node] + 1
//            }
//        }
//    }
//
//    return distance.filter { $0 == distance.max()! }.count
//}

