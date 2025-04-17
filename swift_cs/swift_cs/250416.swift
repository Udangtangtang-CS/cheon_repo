//
//  250416.swift
//  swift_cs
//
//  Created by 천성우 on 4/16/25.
//

import Foundation

func programmers_조이스틱(_ name:String) -> Int {
    let nameArray = Array(name)
    let length = nameArray.count

    // 세로 조작 횟수 개산 ▲▼: 각 알파벳을 'A'에서 바꾸는 데 필요한 최소 횟수
    var answer = nameArray.reduce(0) {
        $0 + min(Int($1.asciiValue! - 65), Int(91 - $1.asciiValue!))
    }

    // 좌우 조작 최소 이동 계산: 커서를 어떻게 움직여야 최소 이동이 되는지 계산
    // 기본은 오른쪽으로 끝까지 가능 경우이기 때문에 하기와 같이 선언
    var move = length - 1

    // 모든 위치에서 A가 연속되는 지점을 기준으로 되돌아가는 경우 고려
    for i in 0..<length {
        var nextIndex = i + 1
        
        // A가 연속되는 구간 찾기
        while nextIndex < length && nameArray[nextIndex] == "A" {
            nextIndex += 1
        }
        
        // case1: i까지 오른쪽으로 가고 다시 돌아가서 끝부분까지 가는 경우
        // case2: 오른쪽으로 끝까지 갔다가 왼쪽으로 돌아오는 경우
        let case1 = i + i + (length - nextIndex)
        let case2 = i + (length - nextIndex) * 2
        move = min(move, min(case1, case2))
    }

    return answer + move
}

/// 1. 세로 조작
///  각 알파벳을 'A'에서 원하는 문자로 바꾸는 데 필요한 횟수를 구합니다.
///  예를 들어 A → B는 1번, A → Z는 아래로 한 번 갈 수 있기 때문에 min(위, 아래)를 사용합니다.
///
///  2. 좌우 조작
///  커서를 왼쪽 혹은 오른쪽으로 이동하면서 문자를 바꿔야 함.
///  A는 바꿀 필요가 없기 때문에 A가 연속된 구간은 건너뛰어야 함.
///  매 위치마다 A가 얼마나 이어지는지 계산하여 case1, case2 두 가지를 비교하여 최소 이동 횟수를 구함. 
