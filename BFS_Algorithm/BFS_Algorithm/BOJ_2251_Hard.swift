//
//  BOJ_.swift
//  BFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/17.
//

import Foundation
//BaekJoon n.2251 (水筒) 重要度: 🎖🎖🎖🎖🎖🎖🎖
// 🎖DFS, BFS (HARD🔥)
// ⚠️途中の段階

//BFSを用いた方法
let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let (A, B, C) = (data[0], data[1], data[2])
var result = Set<Int>()
bfs_pourWater(A, B, C)

var sortedResult = Array(result).sorted().map { String($0) }
print(sortedResult.joined(separator: " "))

func bfs_pourWater(_ capacityA: Int, _ capacityB: Int, _ capacityC: Int) {
    var visited = Array(repeating: Array(repeating: false, count: capacityB + 1), count: capacityA + 1)
    var neededVisitQueue = [(0, 0)] // 最初の水筒A, Bは両方とも 0Lである。
    
    while !neededVisitQueue.isEmpty {
        let (waterAmountA, waterAmountB) = neededVisitQueue.removeFirst()
        let remainedWaterOfC = capacityC - waterAmountA - waterAmountB
        
        guard !visited[waterAmountA][waterAmountB] else {
            continue
        }
        visited[waterAmountA][waterAmountB] = true
        
        if waterAmountA > 0 {
            if waterAmountA >= capacityB - waterAmountB {
                neededVisitQueue.append((waterAmountA - (capacityB - waterAmountB), capacityB))
            } else {
                neededVisitQueue.append((0, waterAmountB + waterAmountA))
            }
            
            if waterAmountA >= capacityC - remainedWaterOfC {
                neededVisitQueue.append((waterAmountA - (capacityC - remainedWaterOfC), waterAmountB))
            } else {
                neededVisitQueue.append((0, waterAmountB))
            }
        }
        
        if waterAmountB > 0 {
            if waterAmountB >= capacityA - waterAmountA {
                neededVisitQueue.append((capacityA, waterAmountB - (capacityA - waterAmountA)))
            } else {
                neededVisitQueue.append((waterAmountB + waterAmountA, 0))
            }
            
            if waterAmountB >= capacityC - remainedWaterOfC {
                neededVisitQueue.append((waterAmountA, (waterAmountB - (capacityC - remainedWaterOfC))))
            } else {
                neededVisitQueue.append((waterAmountA, 0))
            }
        }
        
        if remainedWaterOfC > 0 {
            if remainedWaterOfC >= capacityB - waterAmountB {
                neededVisitQueue.append((waterAmountA, capacityB))
            } else {
                neededVisitQueue.append((waterAmountA, waterAmountB + remainedWaterOfC))
            }
            
            if remainedWaterOfC >= capacityA - waterAmountA {
                neededVisitQueue.append((capacityA, waterAmountB))
            } else {
                neededVisitQueue.append((waterAmountA + remainedWaterOfC, waterAmountB))
            }
        }
    }
    
    for b in 0..<capacityB + 1 where visited[0][b] {
        result.insert(capacityC - b)
    }
}
