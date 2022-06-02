//
//  File.swift
//  Simulation_実装問題
//
//  Created by Kyus'lee on 2022/06/02.
//

import Foundation
//Atcoder Beginners Contest 253
//C. Max_Min Query
//priorityQueue構造体を作り、二つの優先順位キューで解くこともできる
//
////最初はSは、空である
//// REになったコード ,, 実行時間オーバー
//let testCases = Int(readLine()!)!
//var array = [Int]()
//var numCountDict = [Int : Int]()
//var (maxValue, minValue) = (0, Int.max)
//
//for _ in 0..<testCases {
//    let commander = readLine()!.split(separator: " ").map { Int(String($0))! }
//    let commanderType = commander[0]
//
//    switch commanderType {
//    case 1:
//        push(commander[1])
//    case 2:
//        deleteMin(commander[1], count: commander[2])
//    case 3:
//        print(maxValue - minValue)
//    default:
//        exit(0)
//    }
//}
//
//func push(_ num: Int) {
//    if array.isEmpty {
//        array.append(num)
//    } else {
//        if num <= array.first! {
//            array.insert(num, at: 0)
//        } else if num >= array.last! {
//            array.append(num)
//        }
//    }
//
//    minValue = array.first!
//    maxValue = array.last!
//
//    if numCountDict[num] == nil {
//        numCountDict[num] = 1
//    } else {
//        numCountDict[num]! += 1
//    }
//}
//
//func deleteMin(_ num: Int, count: Int) {
//    if numCountDict[num] == nil {
//        return
//    } else {
//        let firstValueIdx = binarySearch(num)
//        let removeRange = min(count, numCountDict[num]!)
//        array.removeSubrange(firstValueIdx...firstValueIdx + removeRange - 1)
//        numCountDict[num]! -= removeRange
//        minValue = array.first!
//        maxValue = array.last!
//    }
//}
//
//func binarySearch(_ targetNum: Int) -> Int {
//    var first = 0
//    var last = array.count - 1
//    var targetIndex = 0
//
//    while first <= last {
//        let middle = (first + last) / 2
//
//        if array[middle] == array.firstIndex(of: targetNum)! {
//            targetIndex = middle
//        } else if array[middle] < array.firstIndex(of: targetNum)! {
//            first = middle + 1
//        } else if array[middle] > array.firstIndex(of: targetNum)! {
//            last = middle - 1
//        }
//    }
//
//    return targetIndex
//}

//方法2: 配列なしで、ただdictionaryだけを用いる方法
// 🌈考察:->> でも十分な問題だった. こっちの方が処理時間が早い

solution()

func solution() {
    let testCases = Int(readLine()!)!
    var numDictionary = [Int: Int]()
    var (minValue, maxValue) = (Int.max, 0)
    
    for _ in 0..<testCases {
        let order = readLine()!.split(separator: " ").map { Int(String($0))! }
        let commandType = order[0]
        
        switch commandType {
        case 1:
            numDictionary[order[1], default: 0] += 1
            minValue = min(minValue, order[1])
            maxValue = max(maxValue, order[1])
        case 2:
            if numDictionary[order[1]] == nil {
                continue
            } else {
                numDictionary[order[1]]! -= min(order[2], numDictionary[order[1]]!)
                
                if numDictionary[order[1]]! == 0 {
                    numDictionary[order[1]] = nil
                    if maxValue == order[1] {
                        maxValue = numDictionary.keys.max() ?? 0
                    }
                    if minValue == order[1] {
                        minValue = numDictionary.keys.min() ?? Int.max
                    }
                }
            }
        case 3:
            print(maxValue - minValue)
        default:
            exit(0)
        }
    }
}
