//
//  File.swift
//  Dynamic_Programming
//
//  Created by Kyus'lee on 2022/06/11.
//

import Foundation
//BaekJoon n.12852(1にさせる2) 重要度: 🎖🎖🎖🎖🎖
// 🎖DP, Graph
var targetNum = Int(readLine()!)!
var dp = Array(repeating: -1, count: 1000001)
var minCount = 0
var result = ""

bfs_checkingMinCount()
print(minCount)
print(result)

func bfs_checkingMinCount() {
    var neededVisitQueue = [(targetNum, 0)]
    var index = 0
    dp[targetNum] = 0
    
    while index < neededVisitQueue.count {
        let (currentNum, currentCount) = neededVisitQueue[index]
        if currentNum == 1 {
            minCount = currentCount
            var wayArray = [currentNum]
            var curIndex = currentNum
            
            while curIndex != targetNum {
                curIndex = dp[curIndex]
                wayArray.append(curIndex)
            }
            
            result = wayArray.reversed().map { String($0) }.joined(separator: " ")
            break
        }
        
        for i in 0..<3 {
            switch i {
            case 0:
                if currentNum % 3 == 0 && (currentNum / 3) >= 1 {
                    if dp[currentNum / 3] == -1 {
                        neededVisitQueue.append((currentNum / 3, currentCount + 1))
                        dp[currentNum / 3] = currentNum
                    }
                }
            case 1:
                if currentNum % 2 == 0 && (currentNum / 2) >= 1 {
                    if dp[currentNum / 2] == -1 {
                        neededVisitQueue.append((currentNum / 2, currentCount + 1))
                        dp[currentNum / 2] = currentNum
                    }
                }
            case 2:
                if (currentNum - 1) >= 1 {
                    if dp[currentNum - 1] == -1 {
                        neededVisitQueue.append((currentNum - 1, currentCount + 1))
                        dp[currentNum - 1] = currentNum
                    }
                }
            default:
                return
            }
            
            
        }
        index += 1
    }
}
