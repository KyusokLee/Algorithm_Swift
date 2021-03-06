//
//  File.swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/06/02.
//

import Foundation
//Atcoder Beginners Contest 253
//D. Fizz Buzz Sum Hard
// ð Math(Hard)
// ð¥floorã¡ã½ãããç¨ãã¦è¨­å®ããæ°å¤ã®ç¯å²åã®num1ãnum2ã®åæ°ã®æ°ãæ±ã (åãæ¨ã¦ãæ°)ããã®åãæ¨ã¦ãæ°å¤ *  (æ°(æ° + 1) / 2  __ (ç­å·®æ°åã®å) )ãããã¨ã§ãç¯å²åã®åæ°ãåãæ±ãããã¨ãã§ãã
solution()

func solution() {
    let data = readLine()!.split(separator: " ").map { Int(String($0))! }
    let upperLimit = data[0]
    var (targetNum1, targetNum2) = (data[1], data[2])
    let lcm = targetNum1 * targetNum2 / euclide(&targetNum1, &targetNum2) //æå°å¬åæ°
    let sumAll = upperLimit * (upperLimit + 1) / 2
    let floor_DividesNum1 = Int(floor(Double(upperLimit) / Double(targetNum1)))
    let floor_DividesNum2 = Int(floor(Double(upperLimit) / Double(targetNum2)))
    let floor_DividesLcm = Int(floor(Double(upperLimit) / Double(lcm)))
    
    let sum1 = targetNum1 * ((floor_DividesNum1 * (floor_DividesNum1 + 1)) / 2)
    let sum2 = targetNum2 * ((floor_DividesNum2 * (floor_DividesNum2 + 1)) / 2)
    let sumOfLcm = lcm * ((floor_DividesLcm * (floor_DividesLcm + 1)) / 2)
    
    print(sumAll - sum1 - sum2 + sumOfLcm)
}

// æå¤§å¬ç´æ°ã®æ±ãæ¹
func euclide(_ num1: inout Int, _ num2: inout Int) -> Int {
    var a = num1
    var b = num2
    var temp = 0
    
    if a < b {
        temp = a
        a = b
        b = temp
    }
    
    var r = a % b
    
    if r == 0 {
        return b
    } else {
        return euclide(&b, &r)
    }
}
