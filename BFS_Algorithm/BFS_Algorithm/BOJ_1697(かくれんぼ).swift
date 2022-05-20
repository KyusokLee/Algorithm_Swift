//
//  File.swift
//  BFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/19.
//

import Foundation
//BaekJoon n.1697 (かくれんぼ) 重要度: 🎖🎖🎖🎖🎖
// かくれんぼシリーズ
// 🎖BFS
let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let (subin, sister) = (data[0], data[1])
var result = 0

bfs_findingSister1(subin)
print(result)

func bfs_findingSister1(_ locate: Int) {
    var neededVisitQueue = [(locate, 0)]
    var index = 0
    var visited = Array(repeating: false, count: 100001)
    visited[locate] = true
    
    while index < neededVisitQueue.count {
        let (curLocate, time) = neededVisitQueue[index]
        
        if curLocate == sister {
            result = time
            return
        }
        
        index += 1
        
        for next in [curLocate - 1, curLocate + 1, curLocate * 2] {
            if next < 0 || next > 100000 {
                continue
            }
            
            if !visited[next] {
                visited[next] = true
                neededVisitQueue.append((next, time + 1))
            }
        }
    }
}
