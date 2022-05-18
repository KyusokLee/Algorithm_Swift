//
//  File.swift
//  BruteForce_Algorithm
//
//  Created by Kyus'lee on 2022/05/18.
//

import Foundation

//BaekJoon n.1065 (一数) Level: 🎖🎖🎖🎖🎖
// 🎖 Brute Force

let data = Int(readLine()!)!
var result = 0

(1...data).forEach {num in
    if checking_OneNum(num) {
        result += 1
    }
}
print(result)

func checking_OneNum(_ num: Int) -> Bool {
    let tempArray = String(num).map { Int(String($0))! }
    guard tempArray.count > 1 else {
        return true
    }
    
    let difference = tempArray[1] - tempArray[0]
    for i in 1..<tempArray.count - 1 {
        if difference != tempArray[i + 1] - tempArray[i] {
            return false
        }
    }
    
    return true
}

