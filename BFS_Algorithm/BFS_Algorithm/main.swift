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

////２次元配列のソート
//var pracArr = [[1, 3], [0, 3], [4, 5]]
//let sortPracArr = pracArr.sorted(by: { $0[0] < $1[0] })
//print(sortPracArr)

// 2022/11/18-
// コーディングテスト準備 (復習 +　補足)
////BaekJoon n.1697 (かくれんぼ) 重要度: 🎖🎖🎖🎖🎖
//// かくれんぼシリーズ Start
//// 🎖BFS
//let location = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (subin, sister) = (location[0], location[1])
//var result = 0
//
//bfs_findingSister(subin)
//print(result)
//
//func bfs_findingSister(_ locate: Int) {
//    // (現在位置、時間)
//    var neededVisitQueue = [(locate, 0)]
//    var index = 0
//    var visited = Array(repeating: false, count: 100001)
//    visited[locate] = true
//
//    while index < neededVisitQueue.count {
//        let (curLocate, time) = neededVisitQueue[index]
//
//        if curLocate == sister {
//            result = time
//            return
//        }
//        index += 1
//
//        for next in [curLocate - 1, curLocate + 1, curLocate * 2] {
//            if next < 0 || next > 100000 {
//                continue
//            }
//
//            if !visited[next] {
//                visited[next] = true
//                neededVisitQueue.append((next, time + 1))
//            }
//        }
//    }
//}

////BaekJoon n.12851 (かくれんぼ2) 重要度: 🎖🎖🎖🎖🎖🎖
//// BFS
//// 1行目: 最も早く見つける時間
//// 2行目: 妹を見つける方法の数
//
//let location = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (subin, sister) = (location[0], location[1])
//// indexの場所についた時間を格納する
//var minTime = Array(repeating: -1, count: 100001)
//// indexの場所に訪問した回数
//var visitedCount = Array(repeating: 0, count: 100001)
//
//bfs_findingSister2(subin)
//
//print("\(minTime[sister])\n\(visitedCount[sister])")
//// (minTime, 訪問回数)を返す
//func bfs_findingSister2(_ locate: Int) {
//    // 現在のsubinの位置
//    var neededVisitQueue = [locate]
//    var index = 0
//    minTime[locate] = 0
//    visitedCount[locate] = 1
//
//    while index < neededVisitQueue.count {
//        let curLocate = neededVisitQueue[index]
//
//        for nextLocate in [curLocate - 1, curLocate + 1, curLocate * 2] {
//            if nextLocate < 0 || nextLocate >= 100001 {
//                continue
//            }
//
//            if minTime[nextLocate] == -1 {
//                // まだ、訪問してないから、-1である
//                minTime[nextLocate] = minTime[curLocate] + 1
//                visitedCount[nextLocate] = visitedCount[curLocate]
//                neededVisitQueue.append(nextLocate)
//            } else if minTime[nextLocate] == minTime[curLocate] + 1 {
//                // 訪問したことのあるところへ移動しようとしている場合であり、その場所に最短時間で行ける場合
//                visitedCount[nextLocate] += visitedCount[curLocate]
//            }
//        }
//
//        index += 1
//    }
//}

//BaekJoon n.17071 (かくれんぼ6) 重要度: 🔥🔥🔥
// 🎖Very Very Hard!
// BFS (始めてのPlatinum問題)
// データの範囲も500000まで増えており、適切なコードの設計が大事
// 1行目: 最も早く見つける時間
// 2行目: 妹を見つける方法の数
// 🔥追加条件: 妹は移動するとき、加速がつく
// 妹が移動するとき、いつも右の方に歩く。つまり、-1のようなback 移動はない
// すなわち、妹が移動する距離は、以前に移動した距離より1を足した分移動する。
// ex) sister first Location: K
// 1秒後　K+1, 2秒後 K+1+2, 3秒後 K+1+2+3
//　500000を超えたら -1を出力

//この問題のpointは、毎回全てのところを訪問すると、分岐が3なので、3^Nになり、時間超過になる
// if文を使ったものじゃなく、for & switch文で実装したコード
let location = readLine()!.split(separator: " ").map { Int(String($0))! }
let (subin, max) = (location[0], 500000)
var sister = location[1]

if subin == sister {
    print(0)
    exit(0)
}

var check = Array(repeating: [-1, -1], count: max + 1)
var neededVisitQueue = [(subin, 0)]
var index = 0
var result = Int.max

while index < neededVisitQueue.count {
    let (curLocate, curTime) = neededVisitQueue[index]
    index += 1
    
    for i in 0..<3 {
        var next = curLocate
        switch i {
        case 0:
            next += 1
        case 1:
            next -= 1
        case 2:
            next *= 2
        default:
            print()
        }
        
        if next <= max, 0 <= next && check[next][(curTime + 1) % 2] == -1 {
            check[next][(curTime + 1) % 2] = curTime + 1
            neededVisitQueue.append((next, curTime + 1))
        }
    }
}

for time in 0...max {
    if sister + time > max {
        break
    }
    sister += time
    
    (0..<2).forEach {
        if check[sister][$0] != -1 && check[sister][$0] <= time && (time - check[sister][$0]) % 2 == 0 {
            result = min(result, time)
        }
    }
}

print(result == Int.max ? -1 : result)





// 📚数字と漢字が混ざったtextのregex Expression testコード

