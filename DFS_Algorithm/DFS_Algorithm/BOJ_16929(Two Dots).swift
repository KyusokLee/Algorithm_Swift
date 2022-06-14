//
//  File.swift
//  DFS_Algorithm
//
//  Created by Kyus'lee on 2022/06/14.
//

import Foundation
//BaekJoon n.16929 (Two Dots) 重要度: 🔥
// 🎖🔥 DFS + Cycle
// 文字列をInt型にParsingした上のシミュレーション実装
// せめて moveCountが4以上じゃないと、隣の場合 cycleであると認知してしまう

typealias Locate = (row: Int, column: Int)
let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let (rowSize, columnSize) = (data[0], data[1])
let directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)] // 東西南北
var visited = Array(repeating: Array(repeating: false, count: columnSize), count: rowSize)
var map = [[Int]]()
var haveCycle = false

// 文字をInt型に変換し、mapにデータを格納する
for _ in 0..<rowSize {
    let input = readLine()!.map { Int(Character(String($0)).asciiValue!) - Int(Character("A").asciiValue!) }
    map += [input]
}

loop: for i in 0..<rowSize {
    for j in 0..<columnSize {
        dfs_findingCycle((i, j), i, j, map[i][j], 0)
        visited = Array(repeating: Array(repeating: false, count: columnSize), count: rowSize)
        
        if haveCycle {
            break loop
        }
    }
}

print(haveCycle ? "Yes" : "No")

func dfs_findingCycle(_ from: Locate, _ row: Int, _ column: Int, _ target: Int, _ moveCount: Int) {
    visited[row][column] = true
    
    for i in 0..<4 {
        let (nextRow, nextColumn) = (row + directionMove[i].row, column + directionMove[i].column)
        if nextRow < 0 || nextRow >= rowSize || nextColumn < 0 || nextColumn >= columnSize || map[nextRow][nextColumn] != target {
            continue
        }
        
        if !visited[nextRow][nextColumn] {
            dfs_findingCycle(from, nextRow, nextColumn, target, moveCount + 1)
            
            if haveCycle {
                break
            }
            
        } else {
            if moveCount >= 3 && (nextRow, nextColumn) == from {
                haveCycle = true
                return
            } else {
                continue
            }
        }
    }
    
    return
}
