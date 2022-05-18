//
//  File.swift
//  DFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/18.
//

import Foundation

//BaekJoon n.1520 (下り坂) 重要度: 🎖🎖🎖🎖🎖🎖🎖🎖
// 🎖DP + DFS (HARD)
// 目的地は、 -> 一番右下にあるマス。すなわち、(rowSize - 1, columnSize - 1)が目的地である
// 問題文でのstart地点は: (0, 0) (一番左上)

typealias Locate = (row: Int, column: Int)
let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let rowSize = data[0], columnSize = data[1]
let directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)] // 東西南北
var dp_visited = Array(repeating: Array(repeating: -1, count: columnSize), count: rowSize)
// 訪問しなかったところは、-1に初期化する , 目的地だけは return 1になる仕組み
// 格納された値は、そのマスから目的地まで辿りつける方法の数を指す

var map = [[Int]]()
var result = 0

for _ in 0..<rowSize {
    map += [readLine()!.split(separator: " ").map { Int(String($0))! }]
}

print(dfs_find_DownHillRoad(0, 0, map[0][0]))

func dfs_find_DownHillRoad(_ row: Int, _ column: Int, _ height: Int) -> Int {
    if (row, column) == (rowSize - 1, columnSize - 1) {
        // 最後の目的地まで行って、dfsの値をreturnする (recursionは、stack構造を従う)
        // 一番最後の処理を行ったものが一番最初にreturnされる -> そのため、一番最初に処理結果に徐々に足される仕組み
        return 1 //今回は、目的地まで辿りつける場合の数を求めるので、着いたという意味で 1 を返さなければならない
    }
    
    if dp_visited[row][column] == -1 {
        //　訪問してない場所であるば、以下の処理を行う
        dp_visited[row][column] = 0
        
        for i in 0..<4 {
            let (nextRow, nextColumn) = (row + directionMove[i].row, column + directionMove[i].column)
            
            if nextRow < 0 || nextRow >= rowSize || nextColumn < 0 || nextColumn >= columnSize {
                continue
            }
            
            if map[nextRow][nextColumn] < height {
                dp_visited[row][column] += dfs_find_DownHillRoad(nextRow, nextColumn, map[nextRow][nextColumn])
            }
        }
    }
    
    return dp_visited[row][column]
}
