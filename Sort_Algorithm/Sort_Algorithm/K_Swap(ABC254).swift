//
//  File.swift
//  Sort_Algorithm
//
//  Created by Kyus'lee on 2022/06/05.
//

import Foundation
//Atcoder Beginners Contest 254
//C. K Swap
// ðSort (Importantð¥)

let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let (N, K) = (data[0], data[1])
let array = readLine()!.split(separator: " ").map { Int(String($0))! }
var sortK = Array(repeating: [Int](), count: K)

guard array != array.sorted() else {
    print("Yes")
    exit(0)
}

// å¥ãæããããå¤ãä¸ã¤ã®éåã«æ¬ã
// ä¾ãã°ã
// n = 7, k = 3
// 4 3 2 1 3 4 5ãä¸ããããã¨ãã   -> (ä¾)
// ããã§ãé¸ã¹ãindexã¯ã7 - 3 = 4. ã¤ã¾ããarray[0] ~ array[3]ã¾ã§é¸ã¶ãã¨ãã§ãã
// ã¾ããk = 3ã§ãããããarray[i] ã¨ãarray[i + 3]ãå¥ãæãããã¨ãã§ããarray[0] ã¨ãarray[3] ã¨ãarray[6]ã§ã¯èªç±ã«å¥ãæãããã¨ãã§ããããã
// ä¸ã¤ã®éåã¨ãã¦æ¬ã (ããindexããå¥ãæ¿ãããã¨ãã§ããé¸æè¢ã®åè£ã®éå)
// ããã§ã¯ãé çªã«å¤ãå¥ãã¦ãã
// ã¤ã¾ããä¸è¨ã®ä¾ã®åæã§ä¸è¨ã®å¦çãè¡ãã¨
// [[4, 1, 5], [3, 3], [2, 4]]ã¨ãªãã
for i in 0..<N {
    sortK[i % K].append(array[i])
}

// ããindexããå¥ãæãããã¨ãã§ããéåæ¯ã«sortå¦çãã¦ãã
// åé¡æã§å¥ãæããä½æ¥­ããã¦ãæé ã«ãªã£ããæ­£è§£ã«ãªããããsortå¦çããã¦ãåã®å¤ã¨æ¯è¼ããªããä¸ã¤ãã¤checkããã
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

// ééã£ãæ¹æ³
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
//// 1åç®ã®åé¡
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
