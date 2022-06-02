//
//  File.swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/06/02.
//

import Foundation
//Atcoder Beginners Contest 253
//A. Slot Median?
// 🎖Math

let data = readLine()!.split(separator: " ").map { Int(String($0))! }

if data[0] <= data[1] && data[1] <= data[2] {
    print("Yes")
} else if data[2] <= data[1] && data[1] <= data[0] {
    print("Yes")
} else {
    print("No")
}
