//
//  duplicate_intervalsFindMerge.swift
//  Sort_Algorithm
//
//  Created by Kyus'lee on 2022/08/13.
//

import Foundation
// startを元に昇順にソートされているが、必ずしもendも昇順にソートされているとは限らない
// 考えられる代表的な例
// [0, 4], [2, 3]
// [0, 4], [2, 5]
// [1, 4], [2, 4]
// [1, 4], [5, 7] ==> 重複にならないケース
// stackを用いること (先頭から組み合わせていく)

// ２次元配列の長さ
let length = Int(readLine()!)!
var inputArray = [[Int]]()

for _ in 0..<length {
    let interval = readLine()!.split(separator: " ").map { Int(String($0))! }
    inputArray.append(interval)
}

print(duplicateFindMerge(inputArray))

// 重複間隔のmergeを行う配列
func duplicateIntervalsFindMerge(_ intervals: [[Int]]) -> [[Int]] {
    // まず、startを基準にソートすること
    let sortedIntervals = intervals.sorted(by: { $0[0] < $1[0] })
    print(sortedIntervals)
    
    var resultArray = [[Int]]()
    var (intervalStart, intervalEnd) = (sortedIntervals[0].first!, sortedIntervals[0].last!)

    // [start, end]の二つの要素を持つ配列
    for i in 1..<sortedIntervals.count {
        let (curStart, curEnd) = (sortedIntervals[i].first!, sortedIntervals[i].last!)
        
        if curStart <= intervalEnd {
            // 重複する場合
            //　intervalEndがcurStartを超えているのであれば、
            intervalEnd = max(intervalEnd, curEnd)
        } else {
            // 重複しない場合 -> 一つの空間として保存
            resultArray.append([intervalStart, intervalEnd])
            (intervalStart, intervalEnd) = (curStart, curEnd)
        }
        
        //一番最後のintervalが残っているとき、その空間は、自動的にresultArrayに格納されるようにすればいい
        if i == sortedIntervals.endIndex - 1 {
            resultArray.append([intervalStart, intervalEnd])
        }
    }

    return resultArray
}
