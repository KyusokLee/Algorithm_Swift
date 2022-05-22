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

////BaekJoon n.2178 (迷路探索) 重要度: 🎖🎖🎖🎖🎖
//// 🎖BFS
//// 問題文で必ず到着値に辿り着けるようなデータだけが入力されるという設定だったため、関数bfs_mazeEscapeがただminCountをreturnするようにした
//typealias Locate = (row: Int, column: Int)
//let data = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (rowSize, columnSize) = (data[0], data[1])
//let directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)] // 東西南北
//var map = [[Int]]()
//var visited = Array(repeating: Array(repeating: false, count: columnSize), count: rowSize)
//
//for _ in 0..<rowSize {
//    let input = readLine()!.map { Int(String($0))! }
//    map += [input]
//}
//
//print(bfs_mazeEscape())
//
//func bfs_mazeEscape() -> Int {
//    var neededVisitQueue = [(0, 0, 1)]
//    var index = 0
//    var minCount = 0
//    visited[0][0] = true
//
//    while index < neededVisitQueue.count {
//        let (curRow, curColumn, moveCount) = neededVisitQueue[index]
//
//        if (curRow, curColumn) == (rowSize - 1, columnSize - 1) {
//            minCount = moveCount
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
//            if map[nextRow][nextColumn] == 1 {
//                visited[nextRow][nextColumn] = true
//                neededVisitQueue.append((nextRow, nextColumn, moveCount + 1))
//            }
//
//        }
//        index += 1
//    }
//
//    return minCount
//}
