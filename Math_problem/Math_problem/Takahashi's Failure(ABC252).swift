//
//  Takahashi's Failure(ABC252).swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/05/28.
//

import Foundation
// Atcoder Beginners Contest 252
//B. Takahashi's Failure

let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let (foods, hateFoods) = (data[0], data[1])
let foodArray = readLine()!.split(separator: " ").map { Int(String($0))! }
let hateFoodArray = readLine()!.split(separator: " ").map { Int(String($0))! }
var willEatHateFoods = false

for check in hateFoodArray {
    if foodArray[check - 1] == foodArray.max() {
        willEatHateFoods = true
        break
    }
}

print(willEatHateFoods ? "Yes" : "No")
