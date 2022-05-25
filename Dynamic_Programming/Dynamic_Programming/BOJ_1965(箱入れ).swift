//
//  File.swift
//  Dynamic_Programming
//
//  Created by Kyus'lee on 2022/05/25.
//

import Foundation
//BaekJoon n.1965 (箱入れ) 重要度: 🎖🎖🎖🎖
// 🎖DP, LISの典型的な問題
let boxCount = Int(readLine()!)!
let boxArray = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = Array(repeating: 0, count: boxCount)

for i in 0..<boxCount {
    dp[i] = 1
    for j in 0..<i {
        if boxArray[i] > boxArray[j] && dp[i] <= dp[j] {
            // dp[i]、つまり今調べているindexに入れたcount数が大きいなら、前のindexに格納したcount数は別に入れなくていい
            // 現在のindexのcount数が大きいから、今の探索している　i のindexに格納したcountがそのまま最長増加部分列(LIS)になる
            dp[i] = dp[j] + 1
        }
    }
}

print(dp.max()!)
