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



//let data = Int(readLine()!)!
//var array = readLine()!.split(separator: " ").map { Int(String($0))! }.sorted()
//let (minValue, maxValue) = (array.first!, array.last!)
//var result = "\(minValue) \(maxValue)" + "\n"
//result += array.map { String($0) }.joined(separator: "")
//print(result)

//3 3
//S##
//###
//..G -> 4が出るべきなのに、7がでる

//3 3
//S##
//###
//..G
//0, 0, 0, 0
//time: 0
//0, 1, 1, 1
//time: 1
//1, 0, 1, 1
//time: 1
//0, 2, 1, 2
//time: 3
//1, 1, 1, 2
//time: 3
//2, 0, 0, 1
//time: 2
//1, 2, 1, 3
//time: 6
//2, 1, 0, 2
//time: 4
//2, 2, 0, 3
//time: 7

//&& visited[nextRow][nextColumn][breakCheck] == -1 {
//    visited[nextRow][nextColumn][breakCheck] = visited[curRow][curColumn][breakCheck] + 1
//    neededVisitQueue.append((nextRow, nextColumn, breakCheck, breakCount))
//    print("nextrow: \(nextRow), nextcolumn: \(nextColumn), wall?: \(breakCheck), breakCount: \(breakCount)")
//    print("nexttime: \(visited[nextRow][nextColumn][breakCheck])")
//}


//前に書いたコード
//typealias Locate = (row: Int, column: Int)
//typealias Check = (row: Int, column: Int, breakCheck: Int, breakCount: Int)
//let mapData = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (rowSize, columnSize) = (mapData[0], mapData[1])
//let directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)] //東西南北
//var neededVisitQueue: [Check] = [Check]()
//var map = [[Character]]()
//var destination = (0, 0)
//var result = 0
//
//for i in 0..<rowSize {
//    let input = readLine()!.map { Character(String($0)) }
//    for j in 0..<columnSize {
//        if input[j] == "S" {
//            neededVisitQueue.append((i, j, 0, 0))
//        } else if input[j] == "G" {
//            destination = (i, j)
//        }
//    }
//    map += [input]
//}
//
//bfs_breakingWall(neededVisitQueue.first!.row, neededVisitQueue.first!.column)
//print(result)
//
//func bfs_breakingWall(_ startRow: Int, _ startColumn: Int) {
//    // 時間を格納するflag配列
//    // visited[0][0][0] -> その位置の壁を壊さないとき, visitedp[0][0][1] -> 壁を壊した場合
//    // -1を入れた意味 : まだ訪問したことないということを再現
//    var visited = Array(repeating: Array(repeating: Array(repeating: -1, count: 2), count: columnSize), count: rowSize)
//    var index = 0
//    visited[startRow][startColumn][0] = 0
//
//    while index < neededVisitQueue.count {
//        let (curRow, curColumn, breakCheck, breakCount) = neededVisitQueue[index]
//
//        if (curRow, curColumn) == destination {
//            result = visited[curRow][curColumn][breakCheck]
//            break
//        }
//
//        for i in 0..<4 {
//            let (nextRow, nextColumn) = (curRow + directionMove[i].row, curColumn + directionMove[i].column)
//
//            if nextRow < 0 || nextRow >= rowSize || nextColumn < 0 || nextColumn >= columnSize {
//                continue
//            }
////            visited[nextRow][nextColumn][breakCheck] != -1
//
//            let nextWall = map[nextRow][nextColumn] == "#" ? 1 : 0
//            if visited[nextRow][nextColumn][nextWall] != -1 {
//                continue
//            }
//
//            if map[nextRow][nextColumn] == "." && visited[nextRow][nextColumn][nextWall] == -1 {
//                visited[nextRow][nextColumn][nextWall] = visited[curRow][curColumn][breakCheck] + 1
//                neededVisitQueue.append((nextRow, nextColumn, nextWall, breakCount))
//            } else if map[nextRow][nextColumn] == "#" && visited[nextRow][nextColumn][nextWall] == -1 {
//                visited[nextRow][nextColumn][nextWall] = visited[curRow][curColumn][breakCheck] + 1 + breakCount
//                neededVisitQueue.append((nextRow, nextColumn, nextWall, breakCount + 1))
//            } else if map[nextRow][nextColumn] == "G" && visited[nextRow][nextColumn][nextWall] == -1 {
//                //Gがあるところは、床であるため、breakCheck = 0を格納する
//                visited[nextRow][nextColumn][nextWall] = visited[curRow][curColumn][breakCheck] + 1
//                neededVisitQueue.append((nextRow, nextColumn, 0, breakCount))
//            }
//        }
//
//        index += 1
//    }
//}




// 🌱Dictionary 練習　(max, filterとsortedの組み合わせ)
//var maxColorCount: [Int: Int] = [1:2, 3:3, 4:4, 2:4]
//var maxOne = maxColorCount.values.max()!
//print(maxOne)
//
//let maxColor = maxColorCount.keys.filter { maxColorCount[$0] == maxOne }.sorted()
//print(maxColor.first!)
