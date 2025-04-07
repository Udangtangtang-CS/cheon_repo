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
