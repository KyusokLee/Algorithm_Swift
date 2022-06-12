//
//  B.swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/06/11.
//

import Foundation
//BaekJoon n.2407(組み合わせ) 重要度: 🎖🎖🎖
// 🎖Math + Big Number Implement
// 大数を効率よくTLEにならないように処理するのが肝心である
//nCr = n! / (n-r)! * r!の公式

let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (data[0], data[1])

// UpperBound 定義
var max: UInt64 = 1000000000000000000

var left = [[UInt64]](repeating: [UInt64](repeating: 0, count: n + 1), count: n + 1)
var right = [[UInt64]](repeating: [UInt64](repeating: 0, count: n + 1), count: n + 1)

right[1][0] = 1
right[1][1] = 1

for i in 2...n {
    right[i][0] = 1
    right[i][i] = 1
    
    for j in 1..<i {
        right[i][j] = right[i - 1][j - 1] + right[i - 1][j]
        left[i][j] = left[i - 1][j - 1] + left[i - 1][j]
        
        if right[i][j] >= max {
            right[i][j] -= max
            left[i][j] += 1
        }
    }
}

if left[n][m] > 0 {
    print("\(left[n][m])\(right[n][m])")
} else {
    print("\(right[n][m])")
}
