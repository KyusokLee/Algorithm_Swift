//
//  File.swift
//  DFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/19.
//

import Foundation
//BaekJoon n.2468 (安全領域) 重要度: 🎖🎖🎖🎖🎖
// 🎖 DFS + Brute Force

typealias Locate = (row: Int, column: Int)
let mapSize = Int(readLine()!)!
let directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)] // 東西南北
var map = [[Int]]()
var maxHeight = 0
var safeZoneCount = 0

for _ in 0..<mapSize {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    if maxHeight < input.max()! {
        maxHeight = input.max()!
    }
    map += [input]
}

for i in 0..<maxHeight {
    safeZoneCount = max(safeZoneCount, setAndCount_SafeZone(i))
}

print(safeZoneCount)

func setAndCount_SafeZone(_ setWaterLevel: Int) -> Int {
    var visited = Array(repeating: Array(repeating: false, count: mapSize), count: mapSize)
    var tempCount = 0
    
    // 水没した場所の更新
    for i in 0..<mapSize {
        for j in 0..<mapSize {
            if map[i][j] <= setWaterLevel {
                visited[i][j] = true //沈んでいる場所は先に、trueにしておくことで、無駄な処理を防ぐ
            }
        }
    }
    
    // 水没していないある場所から安全領域を計算する
    for i in 0..<mapSize {
        for j in 0..<mapSize {
            if !visited[i][j] {
                tempCount += 1
                dfs_countingSafeZone(i, j, &visited)
            }
        }
    }
    
    return tempCount
}

func dfs_countingSafeZone(_ row: Int, _ column: Int, _ checked: inout [[Bool]]) {
    checked[row][column] = true
    
    for i in 0..<4 {
        let (nextRow, nextColumn) = (row + directionMove[i].row, column + directionMove[i].column)
        
        if nextRow < 0 || nextRow >= mapSize || nextColumn < 0 || nextColumn >= mapSize || checked[nextRow][nextColumn] {
            continue
        }
        //上記の条件文ですでにcheckedされた場所はcontinueになるから、ここでもう一度checkedしたか否かの判別条件文は設けなくていい
        dfs_countingSafeZone(nextRow, nextColumn, &checked)
    }
}
