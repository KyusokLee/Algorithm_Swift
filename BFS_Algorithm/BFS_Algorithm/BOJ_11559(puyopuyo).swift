//
//  File.swift
//  BFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/20.
//

import Foundation
//BaekJoon n.11559 (Puyo Puyo) 重要度: 🎖🎖🎖🎖🎖🎖🎖🎖🎖
// 🔥🎖BFS (HARD)
// R: Red, G: Green, B: Blue, P: Purple, Y: Yellow, "." : 空
// 現在与えられたデータでの状況だけを考えるので、temp変数は設けなくていい。

typealias Locate = (row: Int, column: Int)
var map = [[Character]]()
let directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)] // 東西南北
var comboCount = 0

//後に追加する列は,先に入れた列より下に行くように設定
for _ in 0..<12 {
    map.insert(Array(readLine()!), at: 0)
}

while true {
    var checked = Array(repeating: Array(repeating: false, count: 6), count: 12)
    var canCombo = false
    
    //現在のデータで連鎖的にcomboができる場所を全部探す作業
    for i in 0..<12 {
        for j in 0..<6 {
            if map[i][j] != "." {
                //空じゃない場合 色が書いてある場合、comboができるかをbfs探索で探す
                if bfs_findingCombo(i, j, map[i][j], &checked) {
                    if !canCombo {
                        canCombo = true
                    }
                }
            }
        }
    }
    
    //現在のデータでcomboができる場所を全部探してから以下の手順に処理をする
    // if: もし、現在調べるmapでcomboが発生するマスがない場合 -> break してwhile文抜け出す
    // else: comboができる場所がある場合
    //     1. puyopuyo Map のデータを更新
    //     2. 連鎖count (comboCount)を　+ 1する作業
    
    if !canCombo {
        break
    } else {
        puyopuyo_Renewal()
        comboCount += 1
    }
}

print(comboCount)

// comboを探す
func bfs_findingCombo(_ row: Int, _ column: Int, _ targetColor: Character, _ visited: inout [[Bool]]) -> Bool {
    var neededCheckQueue: [Locate] = [(row, column)]
    var index = 0
    var sameColorLength = 1
    visited[row][column] = true
    
    while index < neededCheckQueue.count {
        let (curRow, curColumn) = neededCheckQueue[index]
        
        for i in 0..<4 {
            let (nextRow, nextColumn) = (curRow + directionMove[i].row, curColumn + directionMove[i].column)
            
            if nextRow < 0 || nextRow >= 12 || nextColumn < 0 || nextColumn >= 6 || visited[nextRow][nextColumn] {
                continue
            }
            
            if map[nextRow][nextColumn] == targetColor {
                neededCheckQueue.append((nextRow, nextColumn))
                visited[nextRow][nextColumn] = true
                sameColorLength += 1
            }
        }
        
        index += 1
    }
    
    if sameColorLength >= 4 {
        // 探索し始めたマスから 右、左、上、下の方向に同じcolorの文字が格納されているマスが4つ以上であれば -> Is it combo? true!
        // comboになるのは、自明であるためmapの値を 空(".")に変換する
        neededCheckQueue.forEach {
            map[$0.row][$0.column] = "."
        }
        return true
    } else {
        return false
    }
}

// puyopuyoの mapを更新
// Tetrisのような仕組みで更新していく
// for文の順番に気をつけること!
// 上のある文字が書かれているマスが一番下の行に行く可能性もあるので、for文を３つ設けた
// 🔥row が最優先 -> 理由: その行の上の上まで探って文字があれば 下の行に落とさないと一番下の行まで届かず、中間のどっかの行に留まってしまう
func puyopuyo_Renewal() {
    for column in 0..<6 {
        for belowRow in 0..<11 {
            for upperRow in belowRow + 1..<12 {
                if map[belowRow][column] == "." && map[upperRow][column] != "." {
                    map[belowRow][column] = map[upperRow][column]
                    map[upperRow][column] = "."
                    break
                    //breakしないと -> upperRowは、10行目なのに、belowRowが1行目になってしまい、upperRowの１行下のrowの判別ができなくなる
                }
            }
        }
    }
}
