//
//  ConditionalFibonacci.swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/12/04.
//

import Foundation
//1.
// ConditionalFibonacci
var array = [0, 1, 0, 5]

func fibonacci_C(_ num: Int) -> Int {
    if num == 0 {
        return 0
    } else if num == 1 {
        return 1
    } else if num == 2 {
        return 0
    } else if num == 3 {
        return 5
    }
    
    return fibonacci_C(num - 1) + fibonacci_C(num - 3)
}
print(fibonacci_C(48))
