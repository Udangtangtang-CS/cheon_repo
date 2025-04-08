//
//  250407.swift
//  swift_cs
//
//  Created by 천성우 on 4/7/25.
//

import Foundation

struct Job: Comparable {
    let requestTime: Int
    let duration: Int

    static func < (lhs: Job, rhs: Job) -> Bool {
        return lhs.duration < rhs.duration
    }
}

func programmers_디스크_컨트롤러(_ jobs:[[Int]]) -> Int {
    let taskCount = jobs.count
    let sortedJobs = jobs.sorted { $0[0] < $1[0] }

    var currentTime = 0
    var jobIndex = 0
    var totalResponseTime = 0

    var jobQueue: [Job] = []

    while jobIndex < sortedJobs.count || !jobQueue.isEmpty {
        while jobIndex < sortedJobs.count && sortedJobs[jobIndex][0] <= currentTime {
            let job = Job(requestTime: sortedJobs[jobIndex][0], duration: sortedJobs[jobIndex][1])
            jobQueue.append(job)
            jobIndex += 1
        }

        if jobQueue.isEmpty {
            currentTime = sortedJobs[jobIndex][0]
        } else {
            jobQueue.sort()
            let task = jobQueue.removeFirst()
            currentTime += task.duration
            totalResponseTime += currentTime - task.requestTime
        }
    }

    return totalResponseTime / taskCount
}

//📌 문제 요약
//    •    각 작업은 [요청시간, 처리시간] 형식으로 들어온다.
//    •    하나의 작업만 처리할 수 있으며, 하나의 작업이 끝나야 다음 작업을 시작할 수 있다.
//    •    모든 작업이 처리되는 평균 대기 시간을 최소화해야 한다.
//
//⸻
//
//⚙️ 해결 전략 (SJF)
//    1.    요청 시간 순으로 먼저 정렬해놓고,
//    2.    현재 시간(currentTime) 이전에 도착한 작업 중,
//    3.    가장 처리 시간이 짧은 작업을 골라서 처리한다.
//    4.    작업을 처리할 때마다 현재 시간과 총 대기 시간을 업데이트한다.