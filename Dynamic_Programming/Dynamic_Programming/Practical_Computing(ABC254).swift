//
//  File.swift
//  Dynamic_Programming
//
//  Created by Kyus'lee on 2022/06/04.
//

import Foundation
//Atcoder Beginners Contest 254
//B. Practical Computing
// 🎖Dynamic Programming
let data = Int(readLine()!)!
var dp = Array(repeating: [Int](), count: data)
var result = ""
dp[0] = [1]
result += "\(dp[0][0])\n"

for i in 1..<data {
    for j in 0...i {
        if j == 0 || j == i {
            dp[i].append(1)
        } else {
            dp[i].append(dp[i - 1][j - 1] + dp[i - 1][j])
        }
    }
    result += dp[i].map { String($0) }.joined(separator: " ") + "\n"
}

result.removeLast()
print(result)
