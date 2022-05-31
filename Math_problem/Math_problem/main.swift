//
//  main.swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/05/28.
//

import Foundation
////Atcoder Beginners Contest 253
////A. Slot Median?
//// 🎖Math
//
//let data = readLine()!.split(separator: " ").map { Int(String($0))! }
//
//if data[0] <= data[1] && data[1] <= data[2] {
//    print("Yes")
//} else if data[2] <= data[1] && data[1] <= data[0] {
//    print("Yes")
//} else {
//    print("No")
//}

////Atcoder Beginners Contest 253
////B. Distance Between Tokens
//// 🎖BFS
//typealias Locate = (row: Int, column: Int)
//let data = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (rowSize, columnSize) = (data[0], data[1])
//let directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)] //東西南北
//var haveMoving = [Locate]()
//var map = [[Character]]()
//
//for i in 0..<rowSize {
//    let input = Array(readLine()!)
//    for j in 0..<columnSize {
//        if input[j] == "o" {
//            haveMoving.append((i, j))
//        }
//    }
//    map += [input]
//}
//
//print(bfs(haveMoving[0].row, haveMoving[0].column))
//
//func bfs(_ row: Int, _ column: Int) -> Int {
//    var neededVisitQueue = [(row, column, 0)]
//    var index = 0
//    var result = 0
//    var visited = Array(repeating: Array(repeating: false, count: columnSize), count: rowSize)
//    visited[row][column] = true
//
//    while index < neededVisitQueue.count {
//        let (curRow, curColumn, curCount) = neededVisitQueue[index]
//
//        if (curRow, curColumn) == haveMoving.last! {
//            result = curCount
//            break
//        }
//
//        for i in 0..<4 {
//            let (nextRow, nextColumn) = (curRow + directionMove[i].row, curColumn + directionMove[i].column)
//
//            if nextRow < 0 || nextRow >= rowSize || nextColumn < 0 || nextColumn >= columnSize || visited[nextRow][nextColumn] {
//                continue
//            }
//
//            visited[nextRow][nextColumn] = true
//            neededVisitQueue.append((nextRow, nextColumn, curCount + 1))
//        }
//
//        index += 1
//    }
//
//    return result
//}

//Atcoder Beginners Contest 253
//C. Max_Min Query
//構造体、クラスを用いて解ける
// ⚠️途中の段階

//最初はSは、空である

let testCases = Int(readLine()!)!
var array = [Int]()
var numCountDict = [Int : Int]()
var (maxValue, minValue) = (0, Int.max)

for _ in 0..<testCases {
    let commander = readLine()!.split(separator: " ").map { Int(String($0))! }
    let commanderType = commander[0]
    
    switch commanderType {
    case 1:
        push(commander[1])
    case 2:
        deleteMin(commander[1], count: commander[2])
    case 3:
        print(maxValue - minValue)
    default:
        exit(0)
    }
}

func push(_ num: Int) {
    if array.isEmpty {
        array.append(num)
    } else {
        if num <= array.first! {
            array.insert(num, at: 0)
        } else if num > array.last! {
            array.append(num)
        }
    }
    
    minValue = array.first!
    maxValue = array.last!
    
    if numCountDict[num] == nil {
        numCountDict[num] = 1
    } else {
        numCountDict[num]! += 1
    }
    
//    let i = array.count - 1
//    if i == 0 {
//        maxValue = array[0]
//        minValue = array[0]
//    }
//
//    guard i >= 1 else {
//        return
//    }
//
//    if array[i] > array[i - 1] {
//        maxValue = max(maxValue, array[i])
//    } else if array[i] < array[i - 1] {
//        minValue = min(minValue, array[i])
//    }
}

func deleteMin(_ num: Int, count: Int) {
    if numCountDict[num] == nil || numCountDict[num]! < count {
        return
    }
    
    
    
    
    
    
    
    
}
