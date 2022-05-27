//
//  部分和の探索(left _ right).swift
//  Two_Pointer
//
//  Created by Kyus'lee on 2022/05/27.
//

import Foundation

// 🎖部分和の探索 (two Pointer 問題)
// 基本のprefix sumと partial sumアルゴリズムとは若干異なるアルゴリズムである
// Two Pointerアルゴリズムを使いこなせるようにすること

// 方法1: if文を使った分岐　ーーー＞　こっちの方が処理時間がより早かった!
processTime {
    let arraySize = Int(readLine()!)!
    let dataArray = readLine()!.split(separator: " ").map { Int(String($0))! }
    guard arraySize == dataArray.count else {
        // Error処理
        fatalError("Not valid input. Array size is different")
    }
    print(findPartialEqualSum(dataArray))

    func findPartialEqualSum(_ targetArray: [Int]) -> Int {
        var minIndex = 0
        var leftSum = 0, leftIndex = 0
        var rightSum = 0, rightIndex = targetArray.count - 1

        while leftIndex < rightIndex {
            leftSum += targetArray[leftIndex]
            rightSum += targetArray[rightIndex]

            if (leftSum == rightSum) && (leftIndex < rightIndex) {
                if leftIndex == 0 {
                    leftIndex += 1
                }
                minIndex = leftIndex + 1 // indexが最小値にならないとならないため、leftからのindexにする
                break
            }

            if leftSum > rightSum && (leftIndex < rightIndex) {
                rightIndex -= 1
                leftSum -= targetArray[leftIndex]
                continue
            } else if leftSum < rightSum && (leftIndex < rightIndex) {
                leftIndex += 1
                rightSum -= targetArray[rightIndex]
                continue
            }
        }

        return minIndex
    }
}

// 4 -> [1 2 3 3] : Process Time = 7.293115019798279
//7
//1 2 3 5 2 2 2
//3
//Process Time = 2.813686966896057

// 方法2: while文
//while文でも良い気がしてきたので、内部while文を設けて解いてみた方法
// Plus: 一致するindexを見つけなかった場合 -> return -1する

processTime {
    let arraySize = Int(readLine()!)!
    let dataArray = readLine()!.split(separator: " ").map { Int(String($0))! }
    guard arraySize == dataArray.count else {
        // Error処理
        fatalError("Not valid input. Array size is different")
    }
    print(findPartialEqualSum2(dataArray))

    func findPartialEqualSum2(_ targetArray: [Int]) -> Int {
        var minIndex = 0
        var leftSum = 0, leftIndex = 0
        var rightSum = 0, rightIndex = targetArray.count - 1
        var canFindIndex = false

        while leftIndex < rightIndex {
            leftSum += targetArray[leftIndex]
            rightSum += targetArray[rightIndex]

            while leftSum < rightSum && leftIndex < rightIndex {
                leftIndex += 1
                leftSum += targetArray[leftIndex]
            }

            while leftSum > rightSum && leftIndex < rightIndex {
                rightIndex -= 1
                rightSum += targetArray[rightIndex]
            }

            if leftSum == rightSum && leftIndex < rightIndex {
                if leftIndex == 0 {
                    leftIndex += 1
                }

                minIndex = leftIndex + 1
                canFindIndex = true
                break
            }
        }

        if canFindIndex {
            return minIndex
        } else {
            print("Can't find valid index from partial subArrays")
            return -1
        }

    }
}
//array Size: 7
//array: 1 2 3 5 2 2 2
//resutl: 3
//Process Time = 9.952306032180786
