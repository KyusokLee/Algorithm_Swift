//
//  BOJ_1325.swift
//  DFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/18.
//

import Foundation
//BaekJoon n.1325 (効率的なハッキング) 重要度: 🎖🎖🎖🎖🎖
// 🎖DFS
let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let computerNums = data[0], beliefRelation = data[1]
var relationArray = Array(repeating: [Int](), count: computerNums)
var visited = Array(repeating: false, count: computerNums)
var countDictionary = [Int: Int]()
var maxCount = 0
var result = ""

for _ in 0..<beliefRelation {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
    relationArray[input[1]].append(input[0])
}

for i in 0..<computerNums {
    if !visited[i] {
        dfs_effectiveHacking(from: i, current: i, 1)
        visited[i] = false
    }
    if maxCount < countDictionary[i]! {
        maxCount = countDictionary[i]!
    }
}

result = countDictionary.sorted(by: { $0.key < $1.key }).filter { $0.value == maxCount }.map { String($0.key + 1) }.joined(separator: " ")
print(result)

func dfs_effectiveHacking(from: Int, current: Int, _ count: Int) {
    if relationArray[current].count == 0 {
        if countDictionary[from] == nil {
            countDictionary[from] = count
            return
        } else {
            if countDictionary[from]! < count {
                countDictionary[from] = count
            }
            return
        }
    } else {
        visited[current] = true
    }
    
    for i in relationArray[current] {
        if !visited[i] {
            dfs_effectiveHacking(from: from, current: i, count + 1)
            visited[i] = false
        }
    }
}
