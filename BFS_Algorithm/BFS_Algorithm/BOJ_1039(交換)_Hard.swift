//
//  File.swift
//  BFS_Algorithm
//
//  Created by Kyus'lee on 2022/06/14.
//

import Foundation
//BaekJoon n.1039 (交換) 重要度: 🎖🎖🎖🎖🎖
// 🎖BFS + Math
// Mは 整数Nの桁であるとする。この時、ランダムにi , j を選び、数字を入れ替え、最大となるものを出力する。
// ただし、変えた数字が0から始まるのは排除する。
// 与えられる数字は1000000以下の数字であり、数字の入れ替え可能回数は 10回以下である。

typealias Count = (strNum: [String], moveCount: Int)
let data = readLine()!.split(separator: " ").map { String($0) }
let (strLen, changeCount) = (data[0].count, Int(data[1])!)
var checked = Array(repeating: Array(repeating: false, count: 11), count: 1000001)
// 同じ数字が重複される可能性があるため、その数字ごとに何回目の入れ替えでその数字になったのかをcheck
var targetNumArray = data[0].map { String($0) }
var maxNum = 0 //一回も変化がない場合 -> -1を出力するようにする
bfs_changingNum()

print(maxNum == 0 ? -1 : maxNum)

func bfs_changingNum() {
    var neededVisitQueue: [Count] = [(data[0].map { String($0) }, 0)]
    var index = 0
    
    
    while index < neededVisitQueue.count {
        let currentNum = neededVisitQueue[index]
        index += 1 // depth(入れ替え回数)に当てはまるデータを比較するため、indexの増加が下じゃなく上になければならない
        
        if currentNum.moveCount == changeCount {
            // 移動回数がmaxに達したデータの中、最大値を調査する。
            // 一番早く探し出した値が必ず最大値になるわけではないため、max回数のデータを対象に最大値を全部探す
            maxNum = max(maxNum, Int(currentNum.strNum.joined())!)
            continue
        }
        
        for i in 0..<strLen {
            for j in i + 1..<strLen {
                var temp = currentNum.strNum
                temp.swapAt(i, j)
                
                if temp[0] == "0" {
                    continue
                }
                
                let intNum = Int(temp.joined())!
                if checked[intNum][currentNum.moveCount + 1] {
                    continue
                }
                
                checked[intNum][currentNum.moveCount + 1] = true
                neededVisitQueue.append((temp, currentNum.moveCount + 1))
            }
        }
    }
}
