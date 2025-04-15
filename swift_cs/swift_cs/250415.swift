//
//  250415.swift
//  swift_cs
//
//  Created by 천성우 on 4/15/25.
//

import Foundation

func programmers_큰_수_만들기(_ number:String, _ k:Int) -> String {
    var stack: [Character] = []
    var removeCount = k

    for num in number {
        /// 스택이 비어있지 X, 지울 수 있음, 현재 스택의 last가 지금 num보다 작으면 제거하면서 더 큰 수 앞으로
        while let last = stack.last, removeCount > 0, last < num {
            stack.removeLast()
            removeCount -= 1
        }
        stack.append(num)
    }

    /// for문을 빠져나온 후 지울 숫자가 남아있다면 뒤에서 부터 제거
    if removeCount > 0 {
        stack.removeLast(removeCount)
    }

    return String(stack)
}
