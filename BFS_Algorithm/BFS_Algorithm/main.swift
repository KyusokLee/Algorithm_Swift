//
//  main.swift
//  BFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/17.
//

import Foundation

let commandLineInput = ProcessInfo.processInfo.arguments
var file1 = commandLineInput[1]
var file2 = commandLineInput[2]

func printLine1() -> [[Int]] {
    let filename = file1 //card.txt
    var array1 = Array(repeating: [Int](), count: 3)
    var numCount = 0
    var rowCount = 0
    
    do {
        let contents = try String(contentsOfFile: filename)
        let lines = contents.split(separator: " ").map { Int(String($0))! }
        
        for i in 0..<lines.count {
            numCount += 1
            
            if numCount < 4 {
                array1[rowCount].append(lines[i])
            } else {
                numCount = 0
                rowCount += 1
                array1[rowCount].append(lines[i])
            }
        }
    } catch {
        print("failure cards file")
        return [[-1, -1, -1]]
    }
    
    return array1
}

func printLine2() -> [Int] {
    let filename = file2 // numbers.txt
    var array2: [Int]
    
    do {
        let contents = try String(contentsOfFile: filename)
        let lines = contents.split(separator: " ").map { Int(String($0))! }
        array2 = lines
    } catch {
        print("failure numbers file")
        return [-111]
    }
    
    return array2
}

typealias Locate = (row: Int, column: Int)
let card = printLine1()
let numbers = printLine2()

var checkingCount = 0
var finded = Array(repeating: Array(repeating: false, count: 3), count: 3)
var directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)] //東西南北
var isBingo = false

for currentNum in numbers {
    checkingCount += 1
    findingNum(currentNum)
    
    if isBingo {
        break
    }
}

print(checkingCount)

func findingNum(_ target: Int) {
    for row in 0..<3 {
        for column in 0..<3 {
            if card[row][column] == target {
                finded[row][column] = true
                
                if findingBingo(row, column) {
                    isBingo = true
                }
                return
            }
        }
    }
}

func findingBingo(_ row: Int, _ column: Int) -> Bool {
    var visited = Array(repeating: Array(repeating: false, count: 3), count: 3)
    var neededCheckQueue = [(row, column, 1, 1)]
    var index = 0
    visited[row][column] = true
    
    while index < neededCheckQueue.count {
        let (curRow, curColumn, rowBingo, columnBingo) = neededCheckQueue[index]
        
        if rowBingo == 3 || columnBingo == 3 {
            return true
        }
        
        for i in 0..<4 {
            let (nextRow, nextColumn) = (curRow + directionMove[i].row, curColumn + directionMove[i].column)
            
            if nextRow < 0 || nextRow >= 3 || nextColumn < 0 || nextColumn >= 3 || visited[nextRow][nextColumn] {
                continue
            }
            
            // 塗りつぶしたマスでありながら、同じ行もしくは同じ列にあるなら
            if finded[nextRow][nextColumn] {
                if curRow == nextRow {
                    visited[nextRow][nextColumn] = true
                    neededCheckQueue.append((nextRow, nextColumn, rowBingo + 1, columnBingo))
                } else if curColumn == nextColumn {
                    visited[nextRow][nextColumn] = true
                    neededCheckQueue.append((nextRow, nextColumn, rowBingo, columnBingo + 1))
                }
            }
            
        }
        
        index += 1
    }
    
    return false
}
