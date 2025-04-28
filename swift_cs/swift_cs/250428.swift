//
//  250428.swift
//  swift_cs
//
//  Created by 천성우 on 4/28/25.
//

import Foundation


func programmers_신고_결과_받기(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    let setReports = Set(report)
    var dic: [String:[String]] = [:]
    var result = [String: Int]()
    var banUser: [String] = []

    for r in setReports {
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
    
    return id_list.map { result[$0, default: 0] }
}

func programmers_개인정보_수집_유효기간(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    return []
}
