//
//  QuickSort.swift
//  Sort_Algorithm
//
//  Created by Kyus'lee on 2022/05/22.
//

import Foundation

// 平均 O(nlogn) , 最悪: O(n ^ 2) 理由: pivotが最小値もしくは、最大値に設定された場合
//  方法1: 最初の要素をpivotにした関数
func quickSort(_ array: [Int]) -> [Int] {
    guard let first = array.first, array.count > 1 else {
        return array
    }
 
    let pivot = first // pivotをarrayの最初の要素に設定
    let left = array.filter { $0 < pivot }
    let right = array.filter { $0 > pivot }
    
    // 配列を二つに分けて再帰を通して、目標のarrayを得る
    return quickSort(left) + [pivot] + quickSort(right) //[pivot]を真ん中に
}

var pracArray = [1, 3, 8, 9, 12, 2, 7, 13, 2]
print(quickSort(pracArray)) // [1, 2, 3, 7, 8, 9, 12, 13]
var pracArray1_1 = [1, 3, 8, 9, 12, 2, 1, 7, 13, 2]
print(quickSort(pracArray1_1)) // 重複の2は出力されない 出力: [1, 2, 3, 7, 8, 9, 12, 13]

//  方法2: 真ん中の要素をpivotにした関数, また、重複の要素も全部sortすることができる
func quickSort2(_ array: [Int]) -> [Int] {
    guard array.count > 1 else {
        return array
    }
 
    let pivot = array[array.count / 2]
    let left = array.filter { $0 < pivot }
    let middle = array.filter { $0 == pivot }
    let right = array.filter { $0 > pivot }
    
    // 配列を二つに分けて再帰を通して、目標のarrayを得る
    return quickSort(left) + middle + quickSort(right) //[pivot]を真ん中に
}

var pracArray2 = [1, 3, 8, 9, 12, 2, 7, 13, 2]
print(quickSort2(pracArray2)) // [1, 2, 3, 7, 8, 9, 12, 13]
var pracArray3 = [1, 3, 8, 9, 12, 2, 1, 7, 13, 2]
print(quickSort2(pracArray3)) // [1, 2, 2, 3, 7, 8, 9, 12, 13] 重複の要素 2 もちゃんとソートされた

