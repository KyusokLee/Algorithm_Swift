//
//  BOJ_2178(迷路探索).swift
//  BFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/22.
//

import Foundation
//BaekJoon n.2178 (迷路探索) 重要度: 🎖🎖🎖🎖🎖
// 🎖BFS
// 問題文で必ず到着値に辿り着けるようなデータだけが入力されるという設定だったため、関数bfs_mazeEscapeがただminCountをreturnするようにした
typealias Locate = (row: Int, column: Int)
let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let (rowSize, columnSize) = (data[0], data[1])
let directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)] // 東西南北
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: columnSize), count: rowSize)

for _ in 0..<rowSize {
    let input = readLine()!.map { Int(String($0))! }
    map += [input]
}

print(bfs_mazeEscape())

func bfs_mazeEscape() -> Int {
    var neededVisitQueue = [(0, 0, 1)]
    var index = 0
    var minCount = 0
    visited[0][0] = true

    while index < neededVisitQueue.count {
        let (curRow, curColumn, moveCount) = neededVisitQueue[index]

        if (curRow, curColumn) == (rowSize - 1, columnSize - 1) {
            minCount = moveCount
            break
        }

        for i in 0..<4 {
            let (nextRow, nextColumn) = (curRow + directionMove[i].row, curColumn + directionMove[i].column)

            if nextRow < 0 || nextRow >= rowSize || nextColumn < 0 || nextColumn >= columnSize || visited[nextRow][nextColumn] {
                continue
            }

            if map[nextRow][nextColumn] == 1 {
                visited[nextRow][nextColumn] = true
                neededVisitQueue.append((nextRow, nextColumn, moveCount + 1))
            }

        }
        index += 1
    }

    return minCount
}
