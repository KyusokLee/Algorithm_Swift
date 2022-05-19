//
//  File.swift
//  BFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/19.
//

import Foundation
//BaekJoon n.2146 (橋作り) 重要度: 🎖🎖🎖🎖🎖🎖🎖🎖
// 🎖BFS + 実装力 (HARD)
// 問題説明: 大陸間を結ぶ最も短い長さの橋を作ろう
typealias Locate = (row: Int, column: Int)
let mapSize = Int(readLine()!)!
let directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)] // 東西南北
var visited = Array(repeating: Array(repeating: false, count: mapSize), count: mapSize)
var map = [[Int]]()
var continentNum = 0
var minLengthOfBridge = Int.max

for _ in 0..<mapSize {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    map += [input]
}

// 大陸のNumbering
for i in 0..<mapSize {
    for j in 0..<mapSize {
        if map[i][j] == 1 && !visited[i][j] {
            continentNum += 1
            bfs_numberingContinent(i, j, continentNum)
        }
    }
}

for i in 0..<mapSize {
    for j in 0..<mapSize {
        // 大陸の端っこを探す作業
        if map[i][j] != 0 {
            for k in 0..<4 {
                let (checkRow, checkColumn) = (i + directionMove[k].row, j + directionMove[k].column)

                if checkRow < 0 || checkRow >= mapSize || checkColumn < 0 || checkColumn >= mapSize || map[checkRow][checkColumn] != 0 {
                    continue
                }

                //checkした場所から 右、左、下、上のある方向にさえ海 (0) があれば、bfs探索を始める
                if map[checkRow][checkColumn] == 0 && !visited[checkRow][checkColumn] {
                    visited[checkRow][checkColumn] = true
                    minLengthOfBridge = min(minLengthOfBridge, bfs_CreatingMinBridge(map[i][j], checkRow, checkColumn))
                }
            }
        }
    }
}

print(minLengthOfBridge)

func bfs_numberingContinent(_ row: Int, _ column: Int, _ number: Int) {
    var neededVisitQueue = [(row, column)]
    var index = 0
    visited[row][column] = true
    map[row][column] = number

    while index < neededVisitQueue.count {
        let (curRow, curColumn) = neededVisitQueue[index]

        for i in 0..<4 {
            let (nextRow, nextColumn) = (curRow + directionMove[i].row, curColumn + directionMove[i].column)

            if nextRow < 0 || nextRow >= mapSize || nextColumn < 0 || nextColumn >= mapSize || visited[nextRow][nextColumn] || map[nextRow][nextColumn] == 0 {
                continue
            }

            map[nextRow][nextColumn] = number
            neededVisitQueue.append((nextRow, nextColumn))
            visited[nextRow][nextColumn] = true
        }

        index += 1
    }
}

func bfs_CreatingMinBridge(_ continentFrom: Int, _ row: Int, _ column: Int) -> Int {
    var neededVisitQueue = [(row, column, 1)]
    var tempVisited = visited
    var index = 0
    let tempResult = Int.max

    while index < neededVisitQueue.count {
        let (curRow, curColumn, length) = neededVisitQueue[index]

        if map[curRow][curColumn] != continentFrom && map[curRow][curColumn] != 0 {
            return length - 1
        }

        for i in 0..<4 {
            let (nextRow, nextColumn) = (curRow + directionMove[i].row, curColumn + directionMove[i].column)

            if nextRow < 0 || nextRow >= mapSize || nextColumn < 0 || nextColumn >= mapSize || (tempVisited[nextRow][nextColumn] && map[nextRow][nextColumn] == 0){
                // ただ、tempVisitedが trueの場合をcontinueしてしまうと、他の大陸に届かないため、int.maxが出力される
                // そのため、tempVisitedが trueでありながら、次の場所が0であるなら continueする。こうすることで、fromとは違う大陸に辿り着ける
                continue
            }

            if map[nextRow][nextColumn] != continentFrom {
                tempVisited[nextRow][nextColumn] = true
                neededVisitQueue.append((nextRow, nextColumn, length + 1))
            }

        }
        index += 1
    }

    return tempResult
}
