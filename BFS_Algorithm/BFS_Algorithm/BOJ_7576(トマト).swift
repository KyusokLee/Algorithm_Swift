//
//  File.swift
//  BFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/20.
//

import Foundation
//BaekJoon n.7576 (トマト) 重要度: 🎖🎖🎖🎖🎖🎖
// 🎖BFS
// 0: まだ熟れていないトマトがある場所 ,  1: 熟れたトマトがある場所, -1: トマトがもともと入っていない場所
// 時間超過に気を付けること!

let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let (rowSize, columnSize) = (data[1], data[0])
let directionRow = [0, 0, 1, -1]
let directionColumn = [1, -1, 0, 0] // 東西南北
var neededVisitQueue: [(row: Int, column: Int, counting: Int)] = []
var map = [[Int]]()
var resultDay = 0
var isAllRippened = true

for i in 0..<rowSize {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    for j in 0..<columnSize {
        if input[j] == 1 {
            neededVisitQueue.append((i, j, 0))
        }
    }
    map += [input]
}

bfs_countAllTomatoRippenedDay()

loop: for i in 0..<rowSize {
    for j in 0..<columnSize {
        if map[i][j] == 0 {
            isAllRippened = false
            break loop
        }
    }
}

if isAllRippened {
    print(resultDay)
} else {
    print(-1)
}

func bfs_countAllTomatoRippenedDay() {
    var index = 0
    
    while index < neededVisitQueue.count {
        let (curRow, curColumn, dayCount) = neededVisitQueue[index]
                
        for i in 0..<4 {
            let nextRow = curRow + directionRow[i]
            let nextColumn = curColumn + directionColumn[i]
            
            if nextRow < 0 || nextRow >= rowSize || nextColumn < 0 || nextColumn >= columnSize || map[nextRow][nextColumn] == -1 {
                continue
            }
            
            // 次の場所が1の場合、すでにneededVisitQueueに格納されているため、mapの更新とneededVisitQueueに追加する必要なし
            if map[nextRow][nextColumn] == 0 {
                neededVisitQueue.append((nextRow, nextColumn, dayCount + 1))
                map[nextRow][nextColumn] = 1
            }
        }
        
        resultDay = dayCount
        index += 1
    }
}
