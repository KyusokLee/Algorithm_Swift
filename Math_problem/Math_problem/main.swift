//
//  main.swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/05/28.
//

import Foundation
////Atcoder Beginners Contest 254
////D. Together Square
//// ðMath (ð¥Very Hard)
//
//// æéè¶éã«ãªã£ã¦ãã¾ã£ãã³ã¼ã
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
//// ã¨ã©ãã¹ããã¹ã®ç¯©ã¢ã«ã´ãªãºã ãç¨ãã¦ãnumã®ç´æ°ã®ãã¡æå¤§ã®å¹³æ¹æ°ãæ±ãã   (--> ç´ æ°ãæ¢ãæãå¹æçãªã¢ã«ã´ãªãºã )
//func sieveOfEratosThenes(_ num: Int) -> Int {
////    var divisor = Array(repeating: false, count: num + 1)
//    var maxValue = 1
//
//    //ç´æ°ã®ä¸­ã§ãå¹³æ¹æ°ãæ±ããæ¹æ³
//    if num >= 4 {
//        for i in 2...Int(sqrt(Double(num))) {
//            if num % (i * i) == 0 && (i * i <= num) {
//                maxValue = max(maxValue, i * i)
//            }
//        }
//    }
//
////    let maxSquareDivisor = divisor.enumerated().filter { $0.1 == true }.map { Int($0.0) }.last!
////    // (ç´æ°ã®ä¸­ã®å¹³æ¹æ°ã«ãªãå¤ã®åæ°, maxValue)ãåºå
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
//// æ¹æ³3
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



//// ç¯å²åã®å¹³æ¹æ°ãæ±ãã
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
