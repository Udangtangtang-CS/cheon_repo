//
//  250116.swift
//  swift_cs
//
//  Created by 천성우 on 1/16/25.
//

import Foundation

func programmers_n의배수(_ num:Int, _ n:Int) -> Int {
//    정수 num과 n이 매개 변수로 주어질 때, num이 n의 배수이면 1을
//    return n의 배수가 아니라면 0을 return하도록 solution 함수를 완성해주세요.
    num % n >= 1  ? 0 : 1
}

func programmers_공배수(_ number:Int, _ n:Int, _ m:Int) -> Int {
//    정수 number와 n, m이 주어집니다. number가 n의 배수이면서
//    m의 배수이면 1을 아니라면 0을 return하도록 solution 함수를 완성해주세요.
    return number % n == 0 ? number % m == 0 ? 1 : 0 : 0
}


func programmers_홀짝에_따라_다른_값_반환하기(_ n:Int) -> Int {
//    양의 정수 n이 매개변수로 주어질 때, n이 홀수라면
//    n 이하의 홀수인 모든 양의 정수의 합을 return 하고
//    n이 짝수라면 n 이하의 짝수인 모든 양의 정수의 제곱의
//    합을 return 하는 solution 함수를 작성해 주세요.
    var answer = 0
    
    if n % 2 == 1 {
        for i in 1...n{
            if i % 2 == 1 {
                answer += i
            }
        }
    }
    else {
        for i in 1 ... n {
            if i % 2 == 0 {
                answer += i*i
            }
        }
    }
    return answer
}

func programmers_조건_문자열(_ ineq:String, _ eq:String, _ n:Int, _ m:Int) -> Int {
//    문자열에 따라 다음과 같이 두 수의 크기를 비교하려고 합니다.
//    두 수가 n과 m이라면
//    ">", "=" : n >= m
//    "<", "=" : n <= m
//    ">", "!" : n > m
//    "<", "!" : n < m
//    두 문자열 ineq와 eq가 주어집니다. ineq는 "<"와 ">"중 하나고, eq는 "="와 "!"중 하나입니다. 그리고 두 정수 n과 m이 주어질 때, n과 m이 ineq와 eq의 조건에 맞으면 1을 아니면 0을 return하도록 solution 함수를 완성해주세요.
    ((eq == "=") ? (ineq == ">" ? n >= m : n <= m) : (ineq == ">" ? n > m : n < m)) == true ? 1 : 0
}

func programmers_flag에_따라_다른_값_반환하기(_ a:Int, _ b:Int, _ flag:Bool) -> Int {
//    두 정수 a, b와 boolean 변수 flag가 매개변수로 주어질 때, flag가 true면 a + b를 false면 a - b를 return 하는 solution 함수를 작성해 주세요.
    flag ? a + b : a - b
}
