//
//  File.swift
//  Dynamic_Programming
//
//  Created by Kyus'lee on 2022/06/11.
//

import Foundation
//BaekJoon n.14002(最長増加部分数列4) 重要度: 🔥
// 🎖DP + LIS
// LIS(最長増加部分列)を求め、それに当てはまる数列を求める

// 正解にならなかったコード
//let numCounts = Int(readLine()!)!
//let numArray = readLine()!.split(separator: " ").map { Int(String($0))! }
//var dp = Array(repeating: 1, count: numCounts + 1)
//var maxLength = 0
//var result = ""
//
////LISアルゴリズム
//for i in 1..<numArray.count {
//    var tempArray = [Int]()
//    for j in 0..<i {
//        if numArray[j] < numArray[i] && dp[i] < dp[j] + 1 {
//            dp[i] = dp[j] + 1
//            tempArray.append(numArray[j])
//        }
//    }
//    tempArray.append(numArray[i])
//
//    if dp[i] > maxLength {
//        maxLength = dp[i]
//        result = tempArray.map { String($0) }.joined(separator: " ")
//    }
//}
//
//print(maxLength)
//print(result)

//反例
//3 5 7 9 2 1 4 8
// -> 3 5 7 8 が答え,, 3 5 7 9 が出ちゃう
// 問題では、最長増加部分数列が複数の場合、どれでもいい！と書いてあるので、3 5 7 9 はだめだった

// 正解になるコード
let numCounts = Int(readLine()!)!
let numArray = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: 1, count: numCounts)
var maxLength = 0
var maxLengthArray = [Int]()

//LISアルゴリズム
for i in 1..<numArray.count {
    for j in 0..<i {
        if numArray[j] < numArray[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

maxLength = dp.max()!
print(maxLength)

for i in stride(from: numCounts - 1, through: 0, by: -1) {
    if dp[i] == maxLength {
        maxLengthArray.append(numArray[i])
        maxLength -= 1
    }
}

print(maxLengthArray.reversed().map { String($0) }.joined(separator: " "))

