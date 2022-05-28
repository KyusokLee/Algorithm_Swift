//
//  浮動小数点操作.swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/05/28.
//

import Foundation
//HackerRank
// 🎖Plus Minus
func plusMinus(arr: [Int]) -> String {
    var result = ""
    let sortedArray = arr.sorted()
    var minusCount: Double = 0
    var plusCount: Double = 0
    var zeroCount: Double = 0

    for value in sortedArray {
        if value < 0 {
            minusCount += 1
            continue
        } else if value == 0 {
            zeroCount += 1
        } else {
            plusCount += 1
        }
    }

    result += String(format: "%.6f", plusCount / Double(arr.count)) + "\n"
    result += String(format: "%.6f", minusCount / Double(arr.count)) + "\n"
    result += String(format: "%.6f", zeroCount / Double(arr.count))

    return result
}

let inputArray = readLine()!.split(separator: " ").map { Int(String($0))! }
print(plusMinus(arr: inputArray))

////init(format: String, _ argument: CVarArg)の練習
//// 🌈考察: -> 浮動小数点(実数)桁の出力操作ができる, また、以下のようにC言語のような %d使用の出力操作ができる
//let price = "5000兆"
//let unit = "円"
//let dream = "将来の夢"
//let formatted = String(format: "%@%@が欲しい！！ : %@", price, unit, dream)
//print(formatted)
////出力: 5000兆円が欲しい！！ : 将来の夢
//
//// 変数やリテラール、表現式などの組み合わせで、新しい文字列を構成することを String Interpolation という。
//// 文字列形式指定方法及び関数で、サポートする形式指定者を要約
//// %@は、'description: String property'がreturnする値を出力する
