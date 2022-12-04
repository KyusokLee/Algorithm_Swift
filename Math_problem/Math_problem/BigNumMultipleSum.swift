//
//  BigNumMultipleSum.swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/12/04.
//

import Foundation
//2.
//約数列挙する関数
// isMultiple(of : i) : 倍数であるかどうか
func factors(_ num: Int) -> [Int] {
    var factorsArr = [Int]()

    for i in 1 ... Int(sqrt(Double(num))) {
        if num.isMultiple(of: i) {
            factorsArr.append(i)
            if num / i != i {
                factorsArr.append(num / i)
            }
        }
    }

    let ans = factorsArr.sorted()
    return ans
}

print(factors(20000))

// 約数の和
// 約数をひたすら足していく
func factorsSum(_ num: Int) -> Int {
    var factorsArr = [Int]()

    for i in 1 ... Int(sqrt(Double(num))) {
        if num.isMultiple(of: i) {
            factorsArr.append(i)
            
            if num / i != i {
                factorsArr.append(num / i)
            }
        }
    }

    let filterArr = factorsArr.sorted().filter { 10000 <= $0 && $0 <= 99999 }
    return filterArr.reduce(0) { $0 + $1 }
}

print(factorsSum(30000))
