//
//  File.swift
//  DFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/18.
//

import Foundation

//BaekJoon n.1987 (アルファベット) 重要度: 🎖🎖🎖🎖🎖🎖🎖🎖
// 🎖🔥🔥 DFS + Back Tracking + Bit Masking (HARD)
// 一番左上に動かせる馬がいるとする
// 🌈考察: パソコンは内部的に全てのデータを２進数として表現するため、Bit maskingを用いるとより早い処理時間、簡潔なコード、より少ないメモリ使用ができる
//   1. また、配列に格納するとき、すでに大文字のCharacterのASCIIコードと "A"の ASCIIコードとの値を引いた Int型を配列に格納しておいた
//      -> 2. １のような作業を行うことで、シフト演算を用いた重複値の判別が容易になる
//     例: 1 << 3 ,  1 << 5 など　 1000, 100000となる
//       しかし、ただの　A文字とか B文字をそのまま格納すると 1 << 65 , 1 << 66 などになるからシフト演算の処理に余計に時間がかかる
//     そのため、最初から Asciiコードを引いたInt型を格納することにした

typealias Locate = (row: Int, column: Int)
let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let rowSize = data[0], columnSize = data[1]
let directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
var map = [[Int]]()
var result = 0

// mapに格納する時点で、すでに characterをint型として格納
// "A": ASCII 65
for _ in 0..<rowSize {
    map.append(readLine()!.map { Int($0.asciiValue!) - 65 })
}

dfs_findingAvailable_MaxRoute(0, 0, 1 << map[0][0], 1)
print(result)

func dfs_findingAvailable_MaxRoute(_ row: Int, _ column: Int, _ alphabetBit: Int, _ count: Int) {
    
    for i in 0..<4 {
        let (nextRow, nextColumn) = (row + directionMove[i].row, column + directionMove[i].column)
        
        if nextRow < 0 || nextRow >= rowSize || nextColumn < 0 || nextColumn >= columnSize {
            continue
        }
        
        let nextLocateBit = 1 << map[nextRow][nextColumn] // 次に行く場所の数字をBitMasking
        
        if nextLocateBit & alphabetBit == 0 {
            // 配列に格納した時、全て 65を引いたから使える条件文
            // 全てのbitが一個も被らない場合
            // AND演算子を用いて、同じであるかないかを確認してrecursionを繰り返すように設定しておく
            dfs_findingAvailable_MaxRoute(nextRow, nextColumn, alphabetBit | nextLocateBit, count + 1)
            // alphabetBitの全てのbit と　nextLocateBitの全てのbitを OR演算する 両方とも0であるなら0, じゃないと 1
        }
    }
    
    result = max(result, count)
}
