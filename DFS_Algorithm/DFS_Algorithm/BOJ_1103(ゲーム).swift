//
//  BOJ_1103(ゲーム).swift
//  DFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/24.
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
let directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)] // 東西南北
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

print(dfs_rollingCoin(0, 0, map[0][0]) + 1)
// + 1にする理由: コインを転がして穴に落とすか、それとも、ボードの外に行くようにしないとゲームが終了しない
// そのため、dfs探索で辿りつける場所までの移動回数を求めて、その値に + 1にしてゲームを終了させなければならないから

// return される値が moveCount(移動回数) を意味する
func dfs_rollingCoin(_ row: Int, _ column: Int, _ canMoveDistance: Int) -> Int {
    // 🔥ある場所から出発し、またその出発点に戻ってしまうのかをチェック
    // 🔥探索し始めた出発点への再訪問
    // 無限loopのチェックを先に処理する
    if visited[row][column] {
        // すでに訪問したところであれば、サイクルができてしまい無限loopになる
        // そのため、先に無限loopのチェックをすることで、これからの余計な処理作業を省くことができる
        print(-1)
        exit(0)
    }
    
    // 🔥すでに訪問したところ:
    // 現在の出発点(DFSを始めるときの最初のノード)からの再訪問ではないけど、他の場所からすでにこの場所に訪問し探索済みであるなら、余計な処理を無くす
    // すでに訪問し、その場所からの最大移動回数を格納しておいたため、dpに格納されている値をそのまま返して、以下の処理に進まないようにする
    if dp[row][column] != -1 {
        return dp[row][column]
    }
    
    visited[row][column] = true
    dp[row][column] = 0 // 0に初期化
    
    for i in 0..<4 {
        let (nextRow, nextColumn) = (row + canMoveDistance * directionMove[i].row, column + canMoveDistance * directionMove[i].column)
        
        if nextRow < 0 || nextRow >= rowSize || nextColumn < 0 || nextColumn >= columnSize || map[nextRow][nextColumn] == 0 {
            continue
        }

        //ここで、visitedのcheckを行わない理由は、cycleのチェックをするためには、visitedしたマスもまた、再訪問してからvisitedのチェックをするため
        dp[row][column] = max(dp[row][column], dfs_rollingCoin(nextRow, nextColumn, map[nextRow][nextColumn]) + 1 )
    }
    
    // ある一つの場所からの探索できる全ての経路を探したのであれば、visited フラグを下ろして、他の場所からこの場所にたどり着くことを可能とさせる
    // つまり、他の場所から現在の場所への再訪問ができるようにしないと、正確な移動回数を求めることができない
    // そのため、DP配列にすでに訪問した場所にはその場所から移動できる最大の移動回数を格納したのである
    visited[row][column] = false
    return dp[row][column]
}
