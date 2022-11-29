//
//  CountSevenInRange.swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/11/29.
//

import Foundation
// ただ、思いついた問題
// 問題 → 7以上7777777以下の7の倍数を全て書き出したとき、数字「7」は何回現れるか。
// 効率的な計算量で正解を求めたい
// 正解→777784

func isMultipleOfSeven(_ num: Int) -> Bool {
    // 7の倍数かをcheck
    if num % 7 == 0 {
        return true
    }
    return false
}

// 数字に7があるかどうかの確認
// 7の倍数のときだけ、このメソッドが呼び出されるようにしたい
func hasSevenInNum(_ num: Int) -> Int {
    guard num % 10 != num else {
        if num == 7 {
            return 1
        } else {
            return 0
        }
    }

    var target = num
    var count = 0

    //Check
    while target != 0 {
        //　1の桁から調べていき、10ずつ割ってtarget Numを小さくする
        let compareNum = target % 10

        if compareNum == 7 {
            count += 1
        }

        // 一桁の数字であるとき
        if target % 10 == target {
            break
        } else {
            target /= 10
        }
    }

    return count
}

var resultCount = 0

// 配列を設けるより、もっと早い
// こうすることで、簡単に全部7の倍数になる
for i in stride(from: 7, through: 7777777, by: 7) {
    resultCount += hasSevenInNum(i)
}

print(resultCount)
