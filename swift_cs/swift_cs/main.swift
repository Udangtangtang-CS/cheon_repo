//
//  main.swift
//  swift_cs
//
//  Created by 천성우 on 1/16/25.
//

import Foundation

var id_list: [String] = ["muzi", "frodo", "apeach", "neo"]
var report: [String] = ["muzi frodo", "apeach frodo", "frodo neo", "muzi neo", "apeach muzi"]
var k: Int = 2

var dic: [String:[String]] = [:]
var result = [String: Int]()
var banUser: [String] = []

for r in report {
    let id = r.split(separator: " ")[0]
    let report_id = r.split(separator: " ")[1]
    dic[String(report_id), default: []].append(String(id))
}

banUser = dic.filter { $0.value.count >= k }.map { $0.key }

for user in banUser {
    for r in dic[user] ?? [] {
        result[r, default: 0] += 1
    }
}
print(id_list.map { result[$0, default: 0] })
