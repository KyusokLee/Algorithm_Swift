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
