//
//  main.swift
//  BFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/17.
//

import Foundation
//
//let commandLineInput = ProcessInfo.processInfo.arguments
//print(commandLineInput)
//
//var file1 = "card.txt" //commandLineInput[1]
//var file2 = "numbers.txt" //commandLineInput[2]
//
//func printLine1() -> [[Int]] {
//    let filename = file1 //card.txt
//    var array1 = Array(repeating: [Int](), count: 3)
//    var numCount = 0
//    var rowCount = 0
//
//    do {
//        let contents = try String(contentsOfFile: filename)
//        let lines = contents.split(separator: " ").map { Int(String($0))! }
//
//        for i in 0..<lines.count {
//            numCount += 1
//
//            if numCount < 4 {
//                array1[rowCount].append(lines[i])
//            } else {
//                numCount = 0
//                rowCount += 1
//                array1[rowCount].append(lines[i])
//            }
//        }
//    } catch {
//        print("failure cards file")
//        return [[-1, -1, -1]]
//    }
//
//    return array1
//}
//
//func printLine2() -> [Int] {
//    let filename = file2 // numbers.txt
//    var array2: [Int]
//
//    do {
//        let contents = try String(contentsOfFile: filename)
//        let lines = contents.split(separator: " ").map { Int(String($0))! }
//        array2 = lines
//    } catch {
//        print("failure numbers file")
//        return [-111]
//    }
//
//    return array2
//}
//
//typealias Locate = (row: Int, column: Int)
//let card = printLine1()
//let numbers = printLine2()
//
//print(card)
//print(numbers)

//BaekJoon n.14442 (壁を壊して移動しよう2) 重要度: 🎖🎖🎖🎖🎖🎖🎖🎖🔥
// 🎖🔥BFS (HARD)
// visited 3次元配列の利用が必要

typealias BreakCheck = (row: Int, column: Int, wallBreak: Int)
let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let (rowSize, columnSize) = (data[0], data[1])
let availableToBreakWall = data[2]
let directionMove = [(0, 1), (0, -1), (1, 0), (-1, 0)] //東西南北
var map = [[Int]]()
var visited = Array(repeating: Array(repeating: Array(repeating: 0, count: 2), count: columnSize), count: rowSize)
// 0: Not broken Wall, 1: Broken Wall
var result = -1

//データの格納
for _ in 0..<rowSize {
    map += [readLine()!.map { Int(String($0))! }]
}



func bfs_breakingWall2(_ row: Int, _ column: Int) -> Bool {
    var neededCheckQueue: [BreakCheck] = [(row, column, 0)]
    var index = 0
    visited[row][column][0] = 1
    
    while index < neededCheckQueue.count {
        let (curRow, curColumn, breakCheck) = neededCheckQueue[index]
        
        if (curRow, curColumn) == (rowSize - 1, columnSize - 1) {
            result = visited[curRow][curColumn][breakCheck]
            break
        }
        
        for i in 0..<4 {
            let (nextRow, nextColumn) = (curRow + directionMove[i].0, curColumn + directionMove[i].1)
            var nextCheckWall = breakCheck
            
            if nextRow < 0 || nextRow >= rowSize || nextColumn < 0 || nextColumn >= columnSize || visited[nextRow][nextColumn][breakCheck] != 0 {
                continue
            }
            
            if map[nextRow][nextColumn] == 0 {
                
            } else if nextCheckWall == 0 {
                // 壁があるところにまだ、壁を壊してから探したことはない
            }
            
        }
        
        
    }
    
    
    
    return false
}
