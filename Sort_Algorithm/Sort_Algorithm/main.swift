//
//  main.swift
//  Sort_Algorithm
//
//  Created by Kyus'lee on 2022/05/20.
//

import Foundation

// MergeSort （分割統治）
func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
    
    let middle = array.count / 2
    let left = Array(array[0..<middle])
    let right = Array(array[middle..<array.count])
    
    func merge(_ left: [Int],_ right: [Int]) -> [Int] {
        var leftArray = left // 左の配列
        var rightArray = right // 右の配列
        var result: [Int] = [] //ソートされた配列
        
        while !leftArray.isEmpty && !rightArray.isEmpty {
            if leftArray[0] < rightArray[0] {
                result.append(leftArray.removeFirst())
            } else {
                result.append(rightArray.removeFirst())
            }
        }
        
        // left 配列に残りの要素がないとき
        if !leftArray.isEmpty {
            result.append(contentsOf: leftArray)
        }
        
        // right 配列に残りの要素がないとき
        if !rightArray.isEmpty {
            result.append(contentsOf: rightArray)
        }
        
        return result
    }
    
    return merge(mergeSort(left), mergeSort(right))
}

let practiceArray = readLine()!.split(separator: " ").map { Int(String($0))! }
print(practiceArray)
print(mergeSort(practiceArray)) // ソートされる配列の出力
