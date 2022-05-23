//
//  DFS_exceptSeries_1.swift
//  DFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/23.
//

import Foundation
// Special シーリズ: L2022_S_n.01_
//与えられるデータの数が多くなるとどのような処理が最適であるのかが、肝心である

////1.
//// Dictionary -> Hash Tableであるため、keyとvalueがある。そのため、求めようとするkey値を探すとき、Time Complexityは O(1)である
//// しかし、全てのkey値にhash 衝突があるとき、または、メモリの再割り当てが必要な場合 -> O(n)
//// 本当に簡単すぎた問題..なんでそんなに時間かかってたんだろう。。。。寝不足かな。。後悔してる
//// 最初から入力値が有効でなかったら、error処理をするか、それとも、有効でない部屋番号を重複除外処理で直すかのどっちが正しい選択だったかが気になる
//
//
// ❗️方法1. Arrayで部屋番号を処理した方法
let roomCount = Int(readLine()!)!
//var inputRoomArray1 = [Int]()
//// 入力値が有効じゃない場合、Error処理をして、プログラムを終了させるコード
//guard roomNumConditionCheck(readLine()!, &inputRoomArray1) else {
//    // ここの時点で、自分の部屋番号が入力されないように設定しておく必要があると思う
//    // indexを-1することで、roomConnectionArrayに格納することが容易になる
//    print("Input Error")
//    exit(0)
//}

let inputRoomArray = readLine()!.split(separator: " ").map { Int(String($0))! - 1 }
var result = ""
var tempCount = 0
//guard inputRoomArray.count == roomCount - 1 else {
//    print("error!")
//    exit(0)
//}

var visited = Array(repeating: false, count: roomCount)
var roomConnectionArray = Array(repeating: [Int](), count: roomCount)

// 繋がっている部屋番号を格納
for i in 0..<inputRoomArray.count {
    if i + 1 == inputRoomArray[i] {
        //　繋がっている部屋番号が、自分の部屋番号になっている場合 -> Errorだから　その値だけを除外する意味で continue
        continue
    }
    roomConnectionArray[inputRoomArray[i]].append(i + 1)
    roomConnectionArray[i + 1].append((inputRoomArray[i]))
}

for room in 0..<roomCount {
    var tempCount = 1 // 自分自身(距離: 0の時も含む）
    dfs_roomCount(0, room, room, &tempCount)
    visited[room] = false
    result += "\(tempCount) "
}

result.removeLast()
print(result)

func dfs_roomCount(_ depth: Int, _ roomFrom: Int, _ currentRoom: Int, _ count: inout Int) {
    visited[currentRoom] = true

    for i in roomConnectionArray[currentRoom] {
        if !visited[i] && depth < 3 {
            // Back Tracking : recursionを回る前に条件をcheckして回るようにする)
            // 移動距離が3未満であるときだけ、dfs探索をするようにした
            // depthが3のときも探索を始めると移動距離が4であるものも探ってしまうので、要注意である
            count += 1
            dfs_roomCount(depth + 1, roomFrom, i, &count)
            visited[i] = false
        }
    }
}

func roomNumConditionCheck(_ checkStr: String, _ returnValidArray: inout [Int]) -> Bool {
    let checkArray = checkStr.split(separator: " ").map { Int(String($0))! - 1 }
    guard checkArray.count == roomCount - 1 else {
        return false
    }

    for i in 0..<checkArray.count {
        if i + 1 == checkArray[i] {
            return false
        }
    }

    returnValidArray = checkArray
    return true
}

// ❗️方法2. Dictionaryで部屋番号を処理した方法
let roomCount2 = Int(readLine()!)!
let inputRoomArray2 = readLine()!.split(separator: " ").map { Int(String($0))! } // 今回は、Dictionaryにそのまま index番号を入れたいので、-1をしなかった
var result2 = ""
var tempCount2 = 0
guard inputRoomArray2.count == roomCount2 - 1 else {
    print("error!")
    exit(0)
}

var visited = Array(repeating: false, count: roomCount2 + 1) // 部屋番号のindexの探索を容易にさせるため、最初に0をinsertした
var roomNumDictionary = [Int: [Int]]()

// Dictionaryに key: 部屋番号, value: 繋がっている部屋番号 を格納する作業
for i in 0..<inputRoomArray2.count {
    if i + 2 == inputRoomArray2[i] {
        // i番の部屋番号が繋がっている部屋として、自分自身の部屋番号を指しているなら
        continue
    } else {
        if roomNumDictionary[inputRoomArray2[i]] == nil {
            // まだ、何も格納されていないなら
            if roomNumDictionary[i + 2] == nil {
                roomNumDictionary[inputRoomArray2[i]] = [i + 2]
                roomNumDictionary[i + 2] = [inputRoomArray2[i]]
            } else {
                roomNumDictionary[inputRoomArray2[i]] = [i + 2]
                roomNumDictionary[i + 2]! += [inputRoomArray2[i]]
            }
        } else {
            // すでに、他の部屋番号が格納されている場合
            if roomNumDictionary[i + 2] == nil {
                roomNumDictionary[inputRoomArray2[i]]! += [i + 2]
                roomNumDictionary[i + 2] = [inputRoomArray2[i]]
            } else {
                roomNumDictionary[inputRoomArray2[i]]! += [i + 2]
                roomNumDictionary[i + 2]! += [inputRoomArray2[i]]
            }
        }
    }
}

// 0..<roomCount2にすると、visited[0]も探るようになるから、indexの追加的な演算を通さず アクセスするように設定した
// (例: 0から始まると i + 1 --> 部屋番号: 1を指すように追加的なindexの演算が必要となる)
for i in 1...roomCount2 {
    var tempCount = 1 // 自分自身の部屋番号もcountするから1に初期化
    dfs_roomCount2(0, i, i, &tempCount)
    visited[i] = false // 配列番号　= i
    result2 += "\(tempCount) "
}

result2.removeLast() // resultの最後の無駄な空白(space)を削除する
print(result2)

func dfs_roomCount2(_ depth: Int, _ roomFrom: Int, _ currentRoom: Int, _ count: inout Int) {
    visited[currentRoom] = true
    
    //　自分自身の部屋番号をvalueとして持たないことが、問題の設定であったため、少なくても１つの部屋とは必ずつながることになる
    // そのため、dictionaryのvalueにアクセスするとき、Optional Unwrapping した
    for nextVisit in roomNumDictionary[currentRoom]! {
        if !visited[nextVisit] && depth < 3 {
            count += 1
            dfs_roomCount2(depth + 1, roomFrom, nextVisit, &count)
            visited[nextVisit] = false
        }
    }
}
