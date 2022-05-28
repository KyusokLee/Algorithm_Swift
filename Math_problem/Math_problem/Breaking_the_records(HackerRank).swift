//
//  Breaking_the_records(HackerRank).swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/05/28.
//

import Foundation
//HackerRank
// 🎖Breaking the Records

func breakingRecords(scores: [Int]) -> [Int] {
    var result: [Int] = [Int]()
    var maxCount = 0, maxPoint = scores[0]
    var minCount = 0, minPoint = scores[0]
    
    for next in 1..<scores.count {
        if maxPoint < scores[next] {
            maxPoint = scores[next]
            maxCount += 1
        } else if minPoint > scores[next] {
            minCount += 1
            minPoint = scores[next]
        }
    }
    
    result.append(maxCount)
    result.append(minCount)
    
    return result
}

let inputArray = readLine()!.split(separator: " ").map { Int(String($0))! }
print(breakingRecords(scores: inputArray))
