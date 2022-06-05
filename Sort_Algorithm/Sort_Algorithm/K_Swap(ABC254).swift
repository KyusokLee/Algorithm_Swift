//
//  File.swift
//  Sort_Algorithm
//
//  Created by Kyus'lee on 2022/06/05.
//

import Foundation
//Atcoder Beginners Contest 254
//C. K Swap
// 🎖Sort (Important🔥)

let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, K) = (data[0], data[1])
let array = readLine()!.split(separator: " ").map { Int(String($0))! }
var sortK = Array(repeating: [Int](), count: K)

guard array != array.sorted() else {
    print("Yes")
    exit(0)
}

// 入れ換えられる値を一つの配列に括る
// 例えば、
// n = 7, k = 3
// 4 3 2 1 3 4 5が与えられたとする   -> (例)
// ここで、選べるindexは、7 - 3 = 4. つまり、array[0] ~ array[3]まで選ぶことができる
// また、k = 3であるため、array[i] と　array[i + 3]を入れ換えることができ、array[0] と　array[3] と　array[6]では自由に入れ換えることができるから、
// 一つの配列として括る (あるindexから入れ替えることができる選択肢の候補の配列)
// ここでは、順番に値を入れていく
// つまり、上記の例の前提で下記の処理を行うと
// [[4, 1, 5], [3, 3], [2, 4]]となる。
for i in 0..<N {
    sortK[i % K].append(array[i])
}

// あるindexから入れ換えることができる配列毎にsort処理しておく
// 問題文で入れ換える作業をして、昇順になったら正解になるため、sort処理をして、前の値と比較しながら一つずつcheckをする
for i in 0..<K {
    sortK[i].sort()
}
sortingProcess()

func sortingProcess() {
    var previousValue = 0
    
    for i in 0..<N {
        if previousValue > sortK[i % K][i / K] {
            print("No")
            return
        }
        previousValue = sortK[i % K][i / K]
    }
    
    print("Yes")
}

// 間違った方法
//let data = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (length, settingNum) = (data[0], data[1])
//let targetNum = length - settingNum - 1
//var numArray = readLine()!.split(separator: " ").map { Int(String($0))! }
//let sortedArray = numArray.sorted()
//var dp = Array(repeating: Array(repeating: 0, count: length), count: targetNum + 1)
//var isSorted = false
//var visited = Array(repeating: Array(repeating: false, count: targetNum + 1), count: targetNum + 1)
//
//guard numArray != sortedArray else {
//    print("Yes")
//    exit(0)
//}
//
//// 1回目の分類
//for i in 0...targetNum {
//    var compareArray = numArray
//    compareArray.swapAt(i, i + settingNum)
//    dp[i] = compareArray
//
//    if dp[i] == sortedArray {
//        visited[i][i] = true
//        isSorted = true
//        break
//    } else {
//        visited[i][i] = true
//    }
//}
//
//for i in 0...targetNum {
//
//}
//
////func sortingProcess(_ targetArray: [Int], _ checked: inout [Bool]) {
////    var compareArray = targetArray
////    var newDp = Array(repeating: Array(repeating: 0, count: length), count: targetNum + 1)
////
////    for i in 0...targetNum {
////        if !checked[i] {
////            checked[i] = true
////            compareArray.swapAt(i, i + settingNum)
////            newDp[i] = compareArray
////        }
////
////        if newDp[i] == sortedArray {
////            isSorted = true
////            break
////        } else {
////            checked[i] = true
////        }
////    }
////
////    for i in 0..e
////
////
////}
//
//print(dp)
//
//if isSorted {
//    print("Yes")
//} else {
//    print("No")
//}
