//
//  250321.swift
//  swift_cs
//
//  Created by 천성우 on 3/20/25.
//

import Foundation

func programmers_베스트앨범(_ genres:[String], _ plays:[Int]) -> [Int] {
    var dic: [String : [(Int, Int)]] = [:]
    var genresPlayCount: [String: Int] = [:]
    var result: [Int] = []
    
    for i in 0..<genres.count {
        dic[genres[i], default: []].append((plays[i], i))
        genresPlayCount[genres[i], default: 0] += plays[i]
    }
    
    let sortedGenres = genresPlayCount
        .sorted{ $0.value > $1.value }
        .map { $0.key }
    

    for genre in sortedGenres {
        let soredSongs = dic[genre]!.sorted {
            if $0.0 == $1.0 {
                return $0.1 < $1.1
            }
            return $0.0 > $1.0
        }
        result.append(contentsOf: soredSongs.prefix(2).map { $0.1 })
    }
    return result
}

func programmers_프로세스(_ priorities: [Int], _ location: Int) -> Int {
    var queue = Queue<Int>()
    var order = 0
    
    for i in 0..<priorities.count {
        queue.enqueue(i, priorities[i])
    }
    
    while !queue.isEmpty {
        let current = queue.dequeue()!
        
        if queue.array.contains(where: { $0?.1 ?? 0 > current.1 }) {
            queue.enqueue(current.0, current.1)
        } else {
            order += 1
            if current.0 == location {
                return order
            }
        }
    }
    
    return -1
}

struct Queue<T> {
    var array: [(T, T)?] = []
    private var head: Int = 0
    
    var isEmpty: Bool {
        return array.count - head <= 0
    }
    
    
    mutating func enqueue(_ count: T, _ priority: T) {
        array.append((count, priority))
    }
    
    mutating func dequeue() -> (T, T)? {
        guard head < array.count, let element = array[head] else { return nil }
        array[head] = nil
        head += 1
        
        if head > array.count / 2 {
            array.removeFirst(head)
            head = 0
        }
        return  element
    }
}

