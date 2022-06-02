//
//  File.swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/06/02.
//

import Foundation
//Atcoder Beginners Contest 253
//D. Fizz Buzz Sum Hard
// 🎖 Math(Hard)
// 🔥floorメソッドを用いて設定した数値の範囲内のnum1、num2の倍数の数を求め (切り捨てた数)、その切り捨てた数値 *  (数(数 + 1) / 2  __ (等差数列の和) )することで、範囲内の倍数を和を求めることができる
solution()

func solution() {
    let data = readLine()!.split(separator: " ").map { Int(String($0))! }
    let upperLimit = data[0]
    var (targetNum1, targetNum2) = (data[1], data[2])
    let lcm = targetNum1 * targetNum2 / euclide(&targetNum1, &targetNum2) //最小公倍数
    let sumAll = upperLimit * (upperLimit + 1) / 2
    let floor_DividesNum1 = Int(floor(Double(upperLimit) / Double(targetNum1)))
    let floor_DividesNum2 = Int(floor(Double(upperLimit) / Double(targetNum2)))
    let floor_DividesLcm = Int(floor(Double(upperLimit) / Double(lcm)))
    
    let sum1 = targetNum1 * ((floor_DividesNum1 * (floor_DividesNum1 + 1)) / 2)
    let sum2 = targetNum2 * ((floor_DividesNum2 * (floor_DividesNum2 + 1)) / 2)
    let sumOfLcm = lcm * ((floor_DividesLcm * (floor_DividesLcm + 1)) / 2)
    
    print(sumAll - sum1 - sum2 + sumOfLcm)
}

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
