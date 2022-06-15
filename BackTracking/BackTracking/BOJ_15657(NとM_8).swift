//
//  BOJ_15657(NとM_8).swift
//  BackTracking
//
//  Created by Kyus'lee on 2022/06/15.
//

import Foundation
//BaekJoon n.15657 (NとM (8)) 重要度: 🎖🎖🎖🎖
// 🎖BackTracking + DFS
// 重要なロジック

let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let (numCounts, length) = (data[0], data[1])
let numArray = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
var tempResult = [String]()
var result = ""

dfs(0, 0)
if result != "" {
    result.removeLast()
}
print(result)

func dfs(_ depth: Int, _ start: Int) {
    if depth == length {
        result += tempResult.joined(separator: " ") + "\n"
        return
    }
    
    for i in start..<numCounts {
        tempResult.append(String(numArray[i]))
        dfs(depth + 1, i)
        tempResult.removeLast()
    }
}
