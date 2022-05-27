//
//  BOJ_9446.swift
//  DFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/25.
//

import Foundation
//BaekJoon n.9466 (タームプロジェクト) 重要度: 🎖🎖🎖🎖🎖🎖🎖🎖🎖🎖🔥
// 🎖🔥 DFS + Cycle(HARD)

// 方法1: dfs関数のparameterにinoutパラメータを使い、teamに足しながら結果を求める解き方
var result = ""
termProject()
result.removeLast()
print(result)

func termProject() {
    let testCase = Int(readLine()!)!

    for _ in 0..<testCase {
        let students = Int(readLine()!)!
        let stdSelectStd = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
        var visited = [Bool](repeating: false, count: students + 1)
        var allTeams = [[Int]]()

        for i in 1...students {
            if !visited[i] {
                var team = [Int]()
                dfs_findingPerson(i, stdSelectStd, &team, &allTeams, &visited)
            }
        }
        //flatMap: 多次元配列をflatに一つの配列として変換する
        result += "\(students - allTeams.flatMap { $0 }.count)\n"
    }

    func dfs_findingPerson(_ stdNum: Int, _ stdArray: [Int], _ tempTeam: inout [Int], _ completeTeams: inout [[Int]], _ checked: inout [Bool]) {
        checked[stdNum] = true
        tempTeam.append(stdNum)
        let nextSelect = stdArray[stdNum]

        if !checked[nextSelect] {
            //まだ、checkしてない studentならば -> 再帰関数dfsを回す
            dfs_findingPerson(nextSelect, stdArray, &tempTeam, &completeTeams, &checked)
        } else {
            // 既に、checkをしているstudentならば、(自分自身とチームを組みたい人もいることに注意 (一人だけのチーム))
            if tempTeam.contains(nextSelect) {
                // もし、現在調べている学生が選んだ学生が既にcheckをしている人でありながら、
                // 臨時のTeam(tempTeam)に入っている学生であれば、cycleができてしまう
                // そのため、現在調べる対象の学生が選んだ学生から ... 現在の学生までが完成された１つのチームになる
                completeTeams.append(Array(tempTeam.firstIndex(of: nextSelect)!...tempTeam.endIndex - 1))
            }
            return
        }
    }
}

//方法2: Boolタイプを２つ用いて、結果を求める

var result2 = ""
termProject2()
result2.removeLast()
print(result2)

func termProject2() {
    var count = 0
    var startOfCycle = 0
    
    for _ in 0..<Int(readLine()!)! {
        let studentsNum = Int(readLine()!)!
        var stdSelectStd = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
        var visited = [Bool](repeating: false, count: studentsNum + 1)
        var finished = [Bool](repeating: false, count: studentsNum + 1)
        count = 0
        startOfCycle = 0
        
        for i in 1...studentsNum {
            if !visited[i] {
                dfs(next: i, &stdSelectStd, &visited, &finished)
            }
        }
        
        result2 += "\(studentsNum - count)\n"
    }
    
    func dfs(next current: Int, _ stdArray: inout [Int], _ checked: inout [Bool], _ done: inout [Bool]) {
        if done[current] {
           return
        }
        
        if checked[current] {
            // Cycleが見つかった場合
            count += 1
            startOfCycle = current
            var next = stdArray[current]
            
            while startOfCycle != next {
                next = stdArray[next]
                count += 1
            }
        } else {
            checked[current] = true
            dfs(next: stdArray[current], &stdArray, &checked, &done)
        }
        
        done[current] = true
    }
}

//// ⚠️ちょっと行き詰まった解き方 : メモリ量をどう処理すればいいんだ。。
//var result = ""
//
//func dfs_teamProject() {
//    let testCases = Int(readLine()!)!
//    var tempCount = 0
//    var validCount = 0
//    var haveCycle = false
//
//    for _ in 0..<testCases {
//        let studentNums = Int(readLine()!)!
//        var wantArray = [0] + readLine()!.split(separator: " ").map { Int(String($0))! }
//        var visited = Array(repeating: false, count: studentNums + 1)
//        // indexは学生の番号を、そのindexに格納された値は一緒にチームになりたい学生の番号を指す
//        tempCount = 0
//
//        for i in 1..<wantArray.count {
//            if !visited[i] {
//                if i == wantArray[i] {
//                    tempCount += 1
//                    visited[i] = true
//                } else {
//                    dfs_findingTeam(1, i, i, &visited, &wantArray)
//                }
//            }
//        }
//
//    }
//
//    func dfs_findingTeam(_ depth: Int, _ fromNum: Int, _ curNum: Int, _ checked: inout [Bool], _ stdArray: inout [Int]) {
//        checked[curNum] = true
//        let nextSelect = stdArray[curNum]
//
//        if checked[nextSelect] {
//            // Cycleになり、チームを組むことができる
//            haveCycle = true
//            tempCount = depth
//            return
//        } else {
//            if curNum == nextSelect {
//                // 自分自身とチームになりたい場合 (一人でやる)
//                tempCount += 1
//            } else {
//                // 他の人とチームになりたい場合
//                dfs_findingTeam(depth + 1, fromNum, nextSelect, &checked, &stdArray)
//            }
//        }
//
//        if haveCycle {
//            return
//        }
//    }
//
//
//
//}
