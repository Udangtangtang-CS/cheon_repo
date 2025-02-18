//
//  250218.swift
//  swift_cs
//
//  Created by 천성우 on 2/18/25.
//

import Foundation

func programmers_가운데_글자_가져오기(_ s:String) -> String {
    s.count % 2 == 0 ? "\(Array(s)[s.count / 2  - 1])\(Array(s)[s.count / 2])" : "\(Array(s)[s.count / 2])"
}

func programmers_나누어_떨어지는_숫자_배열(_ arr:[Int], _ divisor:Int) -> [Int] {
    let result = arr.sorted(by: <).filter { $0 % divisor == 0}
    return result == [] ? [-1] : result
}

func programmers_두_정수_사이의_합(_ a:Int, _ b:Int) -> Int64 {
    //    Int64((a > b ? b...a : a...b).reduce(0, +))
    //    위 코드로 제출을 했으나 테스트 4에서 시간 초과 결과를 받아 시간 복잡도를 개선하였습니다
    return Int64((a + b) * (abs(b - a) + 1) / 2)
}

func programmers_문자열_내_p와_y의_개수(_ s:String) -> Bool{
    let result = s.lowercased()
    return result.filter { $0 == "p"}.count == result.filter { $0 == "y" }.count
}

func programmers_문자열_내림차순으로_배치하기(_ s:String) -> String {
    return (String(s.sorted(by: >)))
}
