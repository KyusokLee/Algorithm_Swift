//
//  BOJ_2406(ウイルス).swift
//  DFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/19.
//

import Foundation
//BaekJoon n.2606 (ウイルス) 重要度: 🎖🎖🎖🎖🎖
// 🎖 DFS

//問題設定 1番のパソコンがウイルスにかかった場合、そのパソコンを通してともにウイルスにかかってしまうパソコンの台数を出力
let computerCounts = Int(readLine()!)!
let connectionCounts = Int(readLine()!)!
var connectedArray = Array(repeating: [Int](), count: computerCounts)
var visited = Array(repeating: false, count: computerCounts)
var result = 0

for _ in 0..<connectionCounts {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
    connectedArray[input[0]].append(input[1])
    connectedArray[input[1]].append(input[0])
}

dfs_countVirusComputer(0, 0)
print(result)

func dfs_countVirusComputer(_ from: Int, _ current: Int) {
    if connectedArray[current].count == 0 {
        return
    } else {
        visited[current] = true
    }
    
    for i in connectedArray[current] {
        if !visited[i] {
            result += 1
            dfs_countVirusComputer(from, i)
        }
    }
}
