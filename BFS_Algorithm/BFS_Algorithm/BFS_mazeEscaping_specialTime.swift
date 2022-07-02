//
//  BFS_mazeEscaping_specialTime.swift
//  BFS_Algorithm
//
//  Created by Kyus'lee on 2022/06/20.
//

import Foundation
//SS_problem.1
// 着いたtimeとbreakCountとの連携がうまくできなかった
// そのbreakCountで着いた時間をmemorizeする必要があったと思う -> 今回の場合は、問題でbreakCountに関する詳細を表示するのはないから、正確に変えなかった
// timeのtupleを設けた方が良かったと思う
// timeを求める問題なので、大丈夫
typealias Locate = (row: Int, column: Int)
typealias Check = (row: Int, column: Int, breakCheck: Int, breakCount: Int)
let mapData = readLine()!.split(separator: " ").map { Int(String($0))! }
let (rowSize, columnSize) = (mapData[0], mapData[1])
let directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)] //東西南北
var neededVisitQueue: [Check] = [Check]()
var map = [[Character]]()
var destination = (0, 0)
var result = Int.max

for i in 0..<rowSize {
    let input = readLine()!.map { Character(String($0)) }
    for j in 0..<columnSize {
        if input[j] == "S" {
            neededVisitQueue.append((i, j, 0, 0))
        } else if input[j] == "G" {
            destination = (i, j)
        }
    }
    map += [input]
}

bfs_breakingWall(neededVisitQueue.first!.row, neededVisitQueue.first!.column)
print(result)

func bfs_breakingWall(_ startRow: Int, _ startColumn: Int) {
    // 時間を格納するflag配列
    // visited[0][0][0] -> その位置の壁を壊さないとき, visitedp[0][0][1] -> 壁を壊した場合
    // -1を入れた意味 : まだ訪問したことないということを再現
    var visited = Array(repeating: Array(repeating: Array(repeating: -1, count: 2), count: columnSize), count: rowSize)
    var index = 0
    visited[startRow][startColumn][0] = 0
    
    while index < neededVisitQueue.count {
        //breakCheckは、壁を壊してからたどり着いた経路かを表せるやつ
        let (curRow, curColumn, breakCheck, breakCount) = neededVisitQueue[index]
        index += 1
        print(debugChecking(curRow, curColumn, breakCheck, breakCount, &visited))
        print("index: \(index)")
    
        if (curRow, curColumn) == destination {
            result = min(result, visited[curRow][curColumn][breakCheck])
            continue
        }
        
        for i in 0..<4 {
            let (nextRow, nextColumn) = (curRow + directionMove[i].row, curColumn + directionMove[i].column)
            var nextBreakCheck = breakCheck
            
            if nextRow < 0 || nextRow >= rowSize || nextColumn < 0 || nextColumn >= columnSize {
                continue
            }
//            if map[nextRow][nextColumn] == "." {
//                visited[nextRow][nextColumn][nextCheckWall] = visited[curRow][curColumn][breakCheck] + 1
//                neededVisitQueue.append((nextRow, nextColumn, breakCheck, breakCount))
//            } else if nextCheckWall == 0 {
//                //壁であるが、壊すことが可能
//
//
//
//                visited[nextRow][nextColumn][1] = visited[curRow][curColumn][breakCheck] + 1 + breakCount
//                nextCheckWall = 1
//                neededVisitQueue.append((nextRow, nextColumn, nextCheckWall, breakCount + 1))
//            }

            if map[nextRow][nextColumn] == "." {
                if visited[nextRow][nextColumn][breakCheck] == -1  {
                    //訪問したことない場合
                    visited[nextRow][nextColumn][breakCheck] = visited[curRow][curColumn][breakCheck] + 1
                    neededVisitQueue.append((nextRow, nextColumn, breakCheck, breakCount))
                    print(debugChecking(nextRow, nextColumn, breakCheck, breakCount, &visited))
                } else {
                    //訪問したことある場合
                    if visited[nextRow][nextColumn][breakCheck] > visited[curRow][curColumn][breakCheck] + 1 {
                        visited[nextRow][nextColumn][breakCheck] = visited[curRow][curColumn][breakCheck] + 1
                        print(debugChecking(nextRow, nextColumn, breakCheck, breakCount, &visited))
                        neededVisitQueue.append((nextRow, nextColumn, breakCheck, breakCount))
                    }
                }
            } else if map[nextRow][nextColumn] == "#" {
                //MARK: - ここの方でdebuggingに結構時間がかかった
                if visited[nextRow][nextColumn][breakCheck] == -1  {
                    //訪問したことない場合
                    if nextBreakCheck == 0 {
                        nextBreakCheck = 1
                    }
                    visited[nextRow][nextColumn][nextBreakCheck] = visited[curRow][curColumn][breakCheck] + 1 + breakCount
                    neededVisitQueue.append((nextRow, nextColumn, nextBreakCheck, breakCount + 1))
                    print(debugChecking(nextRow, nextColumn, breakCheck, breakCount, &visited))
                } else {
                    //訪問したことある場合
                    if visited[nextRow][nextColumn][breakCheck] > visited[curRow][curColumn][breakCheck] + 1 + breakCount {
                        visited[nextRow][nextColumn][breakCheck] = visited[curRow][curColumn][breakCheck] + 1 + breakCount
                        print(debugChecking(nextRow, nextColumn, breakCheck, breakCount, &visited))
                        neededVisitQueue.append((nextRow, nextColumn, breakCheck, breakCount))
                    }
//                    neededVisitQueue.append((nextRow, nextColumn, breakCheck, breakCount))
                }
                
                // 3項演算子を使うのがkey point だった
                // その場所に着く前に、壁を壊してから着いたなら、breakCheck = 1
                // そうじゃなく、壁を一回も壊せず、指定した場所に着いたのであれば、breakCheck = 0
//                let curTime = visited[curRow][curColumn][breakCheck]
//                visited[nextRow][nextColumn][breakCheck] = (curTime == -1 ? 0 : curTime) + 1 + breakCount
//                if nextBreakCheck == 0 {
//                    nextBreakCheck = 1
//                }
//                visited[nextRow][nextColumn][nextBreakCheck] = visited[curRow][curColumn][breakCheck] + 1 + breakCount
//                neededVisitQueue.append((nextRow, nextColumn, nextBreakCheck, breakCount + 1))
//                print("nextrow: \(nextRow), nextcolumn: \(nextColumn), wall?: \(nextBreakCheck), breakCount: \(breakCount + 1)")
//                print("nexttime: \(visited[nextRow][nextColumn][nextBreakCheck])")

            } else if map[nextRow][nextColumn] == "G" {
                if visited[nextRow][nextColumn][breakCheck] == -1  {
                    //訪問したことない場合
                    //Gがあるところは、床であるため、breakCheck = 0を格納する
                    visited[nextRow][nextColumn][breakCheck] = visited[curRow][curColumn][breakCheck] + 1
                    neededVisitQueue.append((nextRow, nextColumn, breakCheck, breakCount))
                    print(debugChecking(nextRow, nextColumn, breakCheck, breakCount, &visited))
                } else {
                    //訪問したことある場合
                    if visited[nextRow][nextColumn][breakCheck] > visited[curRow][curColumn][breakCheck] + 1 {
                        visited[nextRow][nextColumn][breakCheck] = visited[curRow][curColumn][breakCheck] + 1
                        print(debugChecking(nextRow, nextColumn, breakCheck, breakCount, &visited))
                        neededVisitQueue.append((nextRow, nextColumn, breakCheck, breakCount))
                    }
                }
            }
        }
    }
}

func debugChecking(_ row: Int, _ column: Int, _ checkBreakWall: Int, _ breakCount: Int, _ visited: inout [[[Int]]]) -> String {
    var result = ""
    result += "Row: \(row), Column: \(column), BreakWallFlag: \(checkBreakWall), BreakCount: \(breakCount)" + "\n"
    result += "Arrival Time: \(visited[row][column][checkBreakWall])"
    return result
}
