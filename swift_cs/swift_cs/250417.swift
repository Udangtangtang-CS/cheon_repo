//
//  250417.swift
//  swift_cs
//
//  Created by 천성우 on 4/17/25.
//

import Foundation

func programmers_기지국_설치(_ n:Int, _ stations:[Int], _ w:Int) -> Int{
    var answer = 0
    var start = 1
    let coverage = 2 * w + 1

    for station in stations {
        let left = station - w
        if start < left {
            let gap = left - start
            answer += Int(ceil(Double(gap) / Double(coverage)))
        }
        start = station + w + 1
    }

    if start <= n {
        let gap = n - start + 1
        answer += Int(ceil(Double(gap) / Double(coverage)))
    }

    return answer
}
//문제 요약
//    •    아파트는 1번부터 N번까지 일렬로 배치되어 있음
//    •    일부 위치에는 이미 기지국이 설치되어 있음
//    •    각 기지국은 설치 위치를 중심으로 좌우로 W칸씩 전파가 퍼짐
//    •    모든 아파트에 전파가 도달하도록 기지국을 추가 설치해야 할 최소 개수를 구해야 함
//
//로직 요약:
//    1.    기지국 사이 빈 구간을 계산
//    2.    각 구간에 대해 필요한 기지국 개수 = ceil(구간 길이 / coverage) 로 계산
//    3.    마지막 기지국 이후에도 구간이 남았다면 동일하게 처리
