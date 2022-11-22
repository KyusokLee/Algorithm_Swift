//
//  BOJ_9251(LCS).swift
//  Dynamic_Programming
//
//  Created by Kyus'lee on 2022/11/22.
//

import Foundation
//BaekJoon n.9251(LCS) 重要度: 🔥🔥
// 🎖DP + LCS
// LCS(最長共通部分数列)を求め、それに当てはまる数列を求める
// LCSは、2つの数列が与えられたとき、共通の部分数列となる数列の中で最も長いものを探す問題
// ex) ACAYKPと CAPCAKの LCSは、　ACAKとなる

let array1 = readLine()!.map { String($0) }
let array2 = readLine()!.map { String($0) }
// 2次元配列
var dp = Array(repeating: Array(repeating: 0, count: array2.count + 1), count: array1.count + 1)
for i in 1...array1.count {
    for j in 1...array2.count {
        if array1[i - 1] == array2[j - 1] {
            // 斜めにあるものの後ろのindexに格納
            dp[i][j] = dp[i - 1][j - 1] + 1
            print(dp)
        } else {
            // 左の方と上の方の中、大きい数字を持ってくる
            dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
            print(dp)
        }
    }
}

print(dp[array1.count][array2.count])
