//
//  main.swift
//  DFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/17.
//

import Foundation

//BaekJoon n.1103 (ゲーム) 重要度: 🎖🎖🎖🎖🎖🎖🎖🎖🔥
// 🎖🔥DP + DFS (HARD)
// cycleができてしまうと、無限に移動できるということだから、-1出力
// 🌈とても良い問題 , 実装スキルが向上する気がして楽しかった
// ⚠️途中の段階

typealias Locate = (row: Int, column: Int)
let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let (rowSize, columnSize) = (data[0], data[1])
let directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (0, -1)] // 東西南北
var dp = Array(repeating: Array(repeating: -1, count: columnSize), count: rowSize)
//dp[x][y] = a は、(x,y)では最大 a 回移動できるという意味

var visited = Array(repeating: Array(repeating: false, count: columnSize), count: rowSize)
var map = [[Int]]()
var hasInfiniteLoop = false

for _ in 0..<rowSize {
    var input = readLine()!.map { String($0) }
    for j in 0..<columnSize {
        if input[j] == "H" {
            // Hがあるマスは、穴であるため、0にしておく
            input[j] = "0"
        }
    }
    map += [input.map { Int(String($0))! }]
}

print(dfs_rollingCoin(0, 0, map[0][0]))

// return される値が moveCount(移動回数) を意味する
func dfs_rollingCoin(_ row: Int, _ column: Int, _ canMoveDistance: Int) -> Int {
    guard row < 0 || row >= rowSize || column < 0 || column >= columnSize || map[row][column] == 0 else {
        return 0
    }
    
    if visited[row][column] {
        // サイクルができてしまい無限loopになるか否かをチェック
        print(-1)
        exit(0)
    }
    
    // すでに訪問したところ
    if dp[row][column] != -1 {
        return dp[row][column]
    }
    
    visited[row][column] = true
    dp[row][column] = 0 // 0に初期化
    
    for i in 0..<4 {
        let (nextRow, nextColumn) = (row + canMoveDistance * directionMove[i].row, column + canMoveDistance * directionMove[i].column)

        //ここで、visitedのcheckを行わない理由は、cycleのチェックをするためには、visitedしたマスもまた、再訪問してからvisitedのチェックをするため
        dp[row][column] = max(dp[row][column], dfs_rollingCoin(nextRow, nextColumn, map[nextRow][nextColumn]) + 1 )
    }
    
    visited[row][column] = false
    return dp[row][column]
}
