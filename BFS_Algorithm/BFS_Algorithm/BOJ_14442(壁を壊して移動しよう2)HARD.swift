//
//  File.swift
//  BFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/25.
//

import Foundation
//BaekJoon n.14442 (壁を壊して移動しよう2) 重要度: 🎖🎖🎖🎖🎖🎖🎖🎖🔥
// 🎖🔥BFS (HARD)
// visited 3次元配列の利用が必要
// アイデアが重要である問題
// とても良い問題

//関数の中で完結させた方が処理時間がより短いし、メモリ量の使用も少ない
func bfs_breakingWall2() {
    typealias BreakCheck = (row: Int, column: Int, wallBreak: Int)
    let data = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (rowSize, columnSize) = (data[0], data[1])
    let availableToBreakWall = data[2]
    let directionMove = [(0, 1), (0, -1), (1, 0), (-1, 0)] //東西南北
    var map = [[Int]]()

    // 3次元の配列[row][column][wallBreak] = 最後のwallBreakが0: 壁を壊してないまま[row][column]を通ったってこと, 1: 壁を壊してその場所を通ったってこと
    var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: availableToBreakWall + 1), count: columnSize), count: rowSize)
    // 最短距離を見つけなかったら不可能という意味で -1を出力するから、-1で初期化した
    var result = -1

    //データの格納
    for _ in 0..<rowSize {
        map += [readLine()!.map { Int(String($0))! }]
    }
    
    // ここからは、bfs探索の作業
    var neededCheckQueue: [BreakCheck] = [(0, 0, 0)]
    var index = 0
    visited[0][0][0] = 1
    
    while index < neededCheckQueue.count {
        let (curRow, curColumn, breakCount) = neededCheckQueue[index]
        
        if (curRow, curColumn) == (rowSize - 1, columnSize - 1) {
            result = visited[curRow][curColumn][breakCount]
            break
        }
        
        for i in 0..<4 {
            let (nextRow, nextColumn) = (curRow + directionMove[i].0, curColumn + directionMove[i].1)
            
            if nextRow < 0 || nextRow >= rowSize || nextColumn < 0 || nextColumn >= columnSize || visited[nextRow][nextColumn][breakCount] != 0 {
                continue
            }
            
            if map[nextRow][nextColumn] == 0 && visited[nextRow][nextColumn][breakCount] == 0 {
                // 壁がない場所であり、その場所に訪問したことない場合
                visited[nextRow][nextColumn][breakCount] = visited[curRow][curColumn][breakCount] + 1
                neededCheckQueue.append((nextRow, nextColumn, breakCount))
            } else if map[nextRow][nextColumn] == 1 && breakCount + 1 <= availableToBreakWall && visited[nextRow][nextColumn][breakCount + 1] == 0 {
                // 壁がある場所であり、その場所にある壁を壊しても破壊可能回数を超えないし、nextCheckWall + 1回壁を壊してその場所に訪問したことのない場合のみ
                visited[nextRow][nextColumn][breakCount + 1] = visited[curRow][curColumn][breakCount] + 1
                neededCheckQueue.append((nextRow, nextColumn, breakCount + 1))
            }
            
        }
        
        index += 1
    }
    
    print(result)
}

bfs_breakingWall2()

