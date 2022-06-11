//
//  File.swift
//  DFS_Algorithm
//
//  Created by Kyus'lee on 2022/06/11.
//

import Foundation
//復習シリーズ
//BaekJoon n.9466 (タームプロジェクト) 重要度: 🔥
// 🎖🔥 DFS + Cycle(HARD)
// ✍️Teamになっていない人の数を求める問題!
let testCases = Int(readLine()!)!
var result = ""

for _ in 0..<testCases {
    let studentCounts = Int(readLine()!)!
    var wantArray = readLine()!.split(separator: " ").map { Int(String($0))! - 1}
    var checked = Array(repeating: false, count: studentCounts)
    var validTeams = [[Int]]()

    // Team メンバーの探し
    for i in 0..<studentCounts {
        if !checked[i] {
            // teamがある人であるか否かのチェックをしてない人であれば、以下の処理を進める
            var team = [Int]()
            dfs_termProject(i, &wantArray, &checked, &team, &validTeams)
        }
    }
    
    result += "\(studentCounts - validTeams.flatMap { $0 }.count)\n"
}

result.removeLast()
print(result)

func dfs_termProject(_ stdIndex: Int, _ stdWantArray: inout [Int], _ check: inout [Bool], _ tempTeam: inout [Int], _ completedTeam: inout [[Int]]) {
    let select = stdWantArray[stdIndex]
    check[stdIndex] = true
    tempTeam.append(stdIndex)

    if !check[select] {
        dfs_termProject(select, &stdWantArray, &check, &tempTeam, &completedTeam)
    } else {
        if tempTeam.contains(select) {
            // Cycleができたら、tempTeamに入れておいたcycleができている部分のみSliceして抽出する
            completedTeam += [Array(tempTeam[tempTeam.firstIndex(of: select)!...tempTeam.endIndex - 1])]
        }
        // 間数の呼び出し先のfor文で　!checkedの場合だけ、間数を呼び出すようにしたが、まだ、checkしてない人の中でもすでに他チームメンバーになっている人を希望する場合がありえる。そのため、else文でもCycleができた場合のif文を設けて、条件を分けて処理するのである。
        return
    }
}
