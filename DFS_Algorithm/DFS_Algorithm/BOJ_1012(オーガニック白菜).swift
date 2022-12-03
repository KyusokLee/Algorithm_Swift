//
//  BOJ1012.swift
//  DFS_Algorithm
//
//  Created by Kyus'lee on 2022/12/03.
//

import Foundation

//BaekJoon n.1012 (オーガニック白菜) 重要度: 🎖🎖🎖
// 🎖DFS Or BFS (Standard)
// 🌈とても良い問題
// 各テストケースに必要な最小のミミズの頭数出力
typealias Locate = (row: Int, column: Int)
let testCase = Int(readLine()!)!
// 東西南北
let direction: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)]
var result = ""

for _ in 0..<testCase {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (rowSize, columnSize, cabbageCounts) = (input[1], input[0], input[2])
    // 栽培地のfield map
    var map = Array(repeating: Array(repeating: false, count: columnSize), count: rowSize)
    var visited = Array(repeating: Array(repeating: false, count: columnSize), count: rowSize)
    var wormCount = 0
    
    // ミミズをfieldに位置させる
    for _ in 0..<cabbageCounts {
        let cabbageLocate = readLine()!.split(separator: " ").map { Int(String($0))! }
        map[cabbageLocate[1]][cabbageLocate[0]] = true
    }
    
    // DFS探索で、周りの場所を探索
    for i in 0..<rowSize {
        for j in 0..<columnSize {
            if map[i][j] && !visited[i][j] {
                // キャベツがあり、訪問してないところであれば、ミミズの頭数を1増やす
                wormCount += 1
                dfs_organicCabbage(i, j, rowSize, columnSize, map, &visited)
            }
        }
    }
    
    result += "\(wormCount)\n"
}

result.removeLast()
print(result)

func dfs_organicCabbage(_ row: Int, _ column: Int, _ rowLimit: Int, _ columnLimit: Int, _ compareMap: [[Bool]], _ checked: inout [[Bool]]) {
    if !compareMap[row][column] && !checked[row][column] {
        //　キャベツがない場所であり、かつ、また、訪問したことないところだったら return
        return
    } else {
        checked[row][column] = true
    }
    
    for i in 0..<4 {
        let (nextRow, nextColumn) = (row + direction[i].row, column + direction[i].column)
        
        if nextRow < 0 || nextRow >= rowLimit || nextColumn < 0 || nextColumn >= columnLimit || checked[nextRow][nextColumn] {
            continue
        }
        
        if compareMap[nextRow][nextColumn] {
            // キャベツがある場合は、dfs再帰
            dfs_organicCabbage(nextRow, nextColumn, rowLimit, columnLimit, compareMap, &checked)
        }
    }
}
