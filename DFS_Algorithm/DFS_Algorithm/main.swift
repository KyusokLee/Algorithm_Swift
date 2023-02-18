//
//  main.swift
//  DFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/17.
//

import Foundation
//
//// 数字だけが入力されるように
//guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!) else {
//    fatalError("Bad input")
//}

//// Array 活用練習
//let rensyu = [3, 5, 7, 9, 11, 8]
//var rensyu2 = [[Int]]()
//
//rensyu2 += [[2, 1]]
//print(rensyu2)
//rensyu2.append(Array(rensyu.firstIndex(of: 5)!...rensyu.endIndex - 1)) // ただ、1 2 3 4 5が格納される
//print(rensyu2)
//rensyu2 += [[3]]
//print(rensyu2)
//
//let slicing = rensyu[1...rensyu.endIndex - 1] // [5, 7, 9, 11, 8]
//print(rensyu[1...rensyu.endIndex - 1]) // [5, 7, 9, 11, 8]
//print(type(of: slicing)) // ArraySlice<Int>型
//let changeTypeToArray = Array(slicing)
//print(changeTypeToArray)  // [5, 7, 9, 11, 8]
//print(type(of: changeTypeToArray)) // Array<Int>型
