//
//  File.swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/05/28.
//

import Foundation
//Atcoder Beginners Contest 252
//C. Slot Strategy
//🔥Hard

//絶対使いこなせるようになる必要がある
// 🌈考察: 数字の桁を扱う問題は、やはり配列indexを設けてやる方法が、一番分かりやすいし効率的である気がした
//    また、問題を見て細かい設計をしてから、問題を解くことは一番大事である
//    成長できた気がした

let testCases = Int(readLine()!)!
var slotArray = [[Int]]()
var count = Array(repeating: Array(repeating: 0, count: 10), count: 10)

for _ in 0..<testCases {
    slotArray += [readLine()!.map { Int(String($0))! }]
}

// slot番号iのj番目に書かれている数字が　slot全体でj文字目に書かれている個数を計算
// 例えば、slotArray[i][j] が1であるとする。また、j = 2とする。
// この場合、1が全てのslotで2文字目に出る数を計算することになる。

for i in 0..<testCases {
    // i = リール番号
    for j in 0..<10 {
        // j = i番目のリールのj番桁を意味
        count[slotArray[i][j]][j] += 1
    }
}

// timeのindexは、そのindexの数字で全てのslotを揃える場合、かかる時間を意味
var time = Array(repeating: 0, count: 10) // 0 ~ 9の数字

for i in 0..<10 {
    for j in 0..<10 {
        time[i] = max(time[i], 10 * (count[i][j] - 1) + j)
    }
}

print(time.min()!)
