//
//  250410.swift
//  swift_cs
//
//  Created by 천성우 on 4/11/25.
//

import Foundation

func programmers_미로_탈출(_ maps: [String]) -> Int {
    let n = maps.count
    let m = maps[0].count
    let maze = maps.map { Array($0) }
    
    typealias Point = (x: Int, y: Int, count: Int)
    
    let dx = [0, 0, -1, 1]
    let dy = [1, -1, 0, 0]
    
    func bfs(from start: (Int, Int), to target: Character) -> Int {
        var visited = Array(repeating: Array(repeating: false, count: m), count: n)
        var queue: [Point] = [(start.0, start.1, 0)]
        visited[start.0][start.1] = true
        
        while !queue.isEmpty {
            let (x, y, count) = queue.removeFirst()
            if maze[x][y] == target { return count }
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx >= 0, ny >= 0, nx < n, ny < m,
                   !visited[nx][ny], maze[nx][ny] != "X" {
                    visited[nx][ny] = true
                    queue.append((nx, ny, count + 1))
                }
            }
        }
        
        return -1
    }
    
    var start = (0, 0)
    for i in 0..<n {
        for j in 0..<m {
            if maze[i][j] == "S" {
                start = (i, j)
            }
        }
    }
    
    let toLever = bfs(from: start, to: "L")
    if toLever == -1 { return -1 }
    
    let leverPos = (0..<n).flatMap { i in
        (0..<m).map { j in (i, j) }
    }.first(where: { maze[$0.0][$0.1] == "L" })!
    
    let toExit = bfs(from: leverPos, to: "E")
    if toExit == -1 { return -1 }
    
    return toLever + toExit
}


func programmers_호텔_대실(_ book_time:[[String]]) -> Int {
    func toMinutes(_ time: String) -> Int {
        let parts = time.split(separator: ":").map { Int($0)! }
        return parts[0] * 60 + parts[1]
    }

    let times = book_time
        .map { (toMinutes($0[0]), toMinutes($0[1]) + 10) }
        .sorted { $0.0 < $1.0 }

    var rooms: [Int] = []

    for (start, end) in times {
        var used = false

        for i in 0..<rooms.count {
            if rooms[i] <= start {
                rooms[i] = end
                used = true
                break
            }
        }

        if !used {
            rooms.append(end)
        }
    }

    return rooms.count
}
