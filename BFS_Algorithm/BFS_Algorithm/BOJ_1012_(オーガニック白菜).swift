//
//  File.swift
//  BFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/18.
//

import Foundation
// 復習シリーズ_ BFS
//BaekJoon n.1012 (オーガニック白菜) 重要度: 🎖🎖🎖🎖🎖
// 🎖BFS
typealias Locate = (row: Int, column: Int)
let testCases = Int(readLine()!)!
let directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)] //東西南北

for _ in 0..<testCases {
    let data = readLine()!.split(separator: " ").map { Int(String($0))! }
    let columnSize = data[0], rowSize = data[1], cabbageCounts = data[2]
    var cabbageList: [Locate] = []
    var map = Array(repeating: Array(repeating: false, count: columnSize), count: rowSize)
    var result = 0

    for _ in 0..<cabbageCounts {
        let cabbageLocate = readLine()!.split(separator: " ").map { Int(String($0))! }
        map[cabbageLocate[1]][cabbageLocate[0]] = true // cabbageがある場所を trueに
        cabbageList.append((cabbageLocate[1], cabbageLocate[0]))
    }

    for i in cabbageList {
        if map[i.row][i.column] {
            result += bfs_organicCabbage(i.row, i.column, rowSize, columnSize, &map)
        }
    }
    print(result)
}

func bfs_organicCabbage(_ row: Int, _ column: Int, _ rowLimit: Int, _ columnLimit: Int, _ compareMap: inout [[Bool]]) -> Int {
    var neededVisitQueue = [(row, column)]
    var visited = Array(repeating: Array(repeating: false, count: columnLimit), count: rowLimit)
    var index = 0
    visited[row][column] = true

    while index < neededVisitQueue.count {
        let (curRow, curColumn) = neededVisitQueue[index]

        for i in 0..<4 {
            let (nextRow, nextColumn) = (curRow + directionMove[i].row, curColumn + directionMove[i].column)

            if nextRow < 0 || nextRow >=  rowLimit || nextColumn < 0 || nextColumn >= columnLimit || visited[nextRow][nextColumn] || !compareMap[nextRow][nextColumn]{
                continue
            }

            if compareMap[nextRow][nextColumn] {
                visited[nextRow][nextColumn] = true
                neededVisitQueue.append((nextRow, nextColumn))
                compareMap[nextRow][nextColumn] = false
            }
        }

        index += 1
    }

    return 1
}

//dfsを用いた方法 -> こっちの方が早かった
typealias Locate = (row: Int, column: Int)
let testCases = Int(readLine()!)!
let directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)] // 東西南北
var result = ""

for _ in 0..<testCases {
    let data = readLine()!.split(separator: " ").map { Int(String($0))! }
    let rowSize = data[1], columnSize = data[0], cabbageCounts = data[2]
    var map = Array(repeating: Array(repeating: false, count: columnSize), count: rowSize)
    var visited = Array(repeating: Array(repeating: false, count: columnSize), count: rowSize)
    var wormCount = 0
    
    for _ in 0..<cabbageCounts {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        map[input[1]][input[0]] = true // キャベツある場所 -> true
    }
    
    for i in 0..<rowSize {
        for j in 0..<columnSize {
            if map[i][j] && !visited[i][j] {
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
        // キャベツがない場所であり、かつ、まだ、訪問してないところだったら　return
        return
    } else {
        checked[row][column] = true
    }
    
    for i in 0..<4 {
        let (nextRow, nextColumn) = (row + directionMove[i].row, column + directionMove[i].column)
        
        if nextRow < 0 || nextRow >= rowLimit || nextColumn < 0 || nextColumn >= columnLimit || checked[nextRow][nextColumn] {
            continue
        }
        
        if compareMap[nextRow][nextColumn] {
            // キャベツがあるなら　dfs再帰
            dfs_organicCabbage(nextRow, nextColumn, rowLimit, columnLimit, compareMap, &checked)
        }
    }
}
