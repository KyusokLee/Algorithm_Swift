//
//  QuickSort.swift
//  Sort_Algorithm
//
//  Created by Kyus'lee on 2022/05/22.
//

import Foundation

func quickSort(_ array: [Int]) -> [Int] {
    guard let first = array.first, array.count > 1 else {
        return array
    }
 
    let pivot = first
    let left = array.filter { $0 < pivot }
    let right = array.filter { $0 > pivot }
    
    // 配列を二つに分けて再帰を通して、目標のarrayを得る
    return quickSort(left) + [pivot] + quickSort(right) //[pivot]を真ん中に
}

var pracArray = [1, 3, 8, 9, 12, 2, 7, 13, 2]
print(quickSort(pracArray))

pracArray += [111]
print(pracArray)
