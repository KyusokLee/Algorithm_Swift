//
//  main.swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/05/28.
//

import Foundation
////Atcoder Beginners Contest 254
////D. Together Square
//// 🎖Math (🔥Very Hard)
//
//// 時間超過になってしまったコード
//let data = Int(readLine()!)!
//var checkArray = Array(repeating: 0, count: data + 1)
//var count = 0
//
//for i in 1...data {
//    let input = i / sieveOfEratosThenes(i)
//    checkArray[i] = input
//}
//
//for i in 1...data {
//    for j in 1...data {
//        if checkArray[i] == checkArray[j] {
//            count += 1
//        }
//    }
//}
//
//print(count)
//
//// エラトステネスの篩アルゴリズムを用いて、numの約数のうち最大の平方数を求める   (--> 素数を探す最も効果的なアルゴリズム)
//func sieveOfEratosThenes(_ num: Int) -> Int {
////    var divisor = Array(repeating: false, count: num + 1)
//    var maxValue = 1
//
//    //約数の中で、平方数を求める方法
//    if num >= 4 {
//        for i in 2...Int(sqrt(Double(num))) {
//            if num % (i * i) == 0 && (i * i <= num) {
//                maxValue = max(maxValue, i * i)
//            }
//        }
//    }
//
////    let maxSquareDivisor = divisor.enumerated().filter { $0.1 == true }.map { Int($0.0) }.last!
////    // (約数の中の平方数になる値の個数, maxValue)を出力
////
////    return maxSquareDivisor
//    return maxValue
//}
//
//
//
//
//
//
//
//// 方法3
//let n = Int(readLine()!)!
//var result = 0
//
//for i in 1...n {
//    var j = i
//    var d = 2
//    while d * d <= j {
//        while j % (d * d) == 0 {
//            j /= d * d
//        }
//        d += 1
//    }
//    d = 1
//
//    while j * d * d <= n {
//        result += 1
//        d += 1
//    }
//}
//print(result)



//// 範囲内の平方数を求める
//func sieveOfEratosThenes(_ num: Int) {
//    var isSquareNum: [Bool] = Array(repeating: false, count: num + 1)
//    isSquareNum[0] = false
//    isSquareNum[1] = true
//
//    if num >= 4 {
//        for i in 2...Int(sqrt(Double(num))) {
//            isSquareNum[i * i] = true
//        }
//    }
//
//    let maxNotPrime = isSquareNum.enumerated().filter { $0.1 == true }.map { Int($0.0) }.max()!
//    print(maxNotPrime)
//}

