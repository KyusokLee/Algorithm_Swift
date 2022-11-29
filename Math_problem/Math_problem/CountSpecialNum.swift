//
//  CountSpecialNum.swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/11/29.
//

import Foundation
// 大規模のデータがパスできた！
//❗️ 📚7が入る日付であったら、7の個数分ポイント追加的にもらえる -> 目標点数をgetするまでの最小日数
// ―――＞　動的計画法 (配列を用した) (与えられるデータの上限値を配列の大きさに設定し、)
// 目標とするポイントを満たすまでかかったdaysを求める問題

let data = readLine()!.split(separator: " ").map { Int(String($0))! }
// 初期値、追加されるポイント、目標ポイント
let (initialPoint, bPoint, targetPoint) = (data[0], data[1], data[2])
var (currentDay, currentPoint) = (0, initialPoint)
var dayIndex = 0

// 日付に7が何個あるかを数えるメソッド
func checkSevenCount(_ day: Int) -> Int {
    // 一桁の数字はguard文で処理して返すように
    guard day % 10 != day else {
        if day == 7 {
            return 1
        } else {
            return 0
        }
    }
    
    var compareDay = day
    var count = 0
    
    while compareDay != 0 {
        //　1の桁から調べていき、10ずつ割ってcompareNumを小さくする
        let compareNum = compareDay % 10
        
        if compareNum == 7 {
            count += 1
        }
        
        if compareDay % 10 == compareDay {
            break
        } else {
            compareDay /= 10
        }
    }

    return count
}

// 現在のpointがtargetPointより小さいときまで繰り返す
// overになったときは、そのままdayIndexを返せばいい
while currentPoint < targetPoint {
    var initPoint = initialPoint
    // 何個の7が日付にあるかをInt型で示す
    let sevenCount = checkSevenCount(currentDay + 1)
    
    //　基本ポイント + 追加分Point * 日付にある7の数
    //　７が入ってない日付なら、SevenCountが0となり、基本ポイントであるInitial Pointだけ追加される
    initPoint = initPoint + bPoint * sevenCount
    currentDay += 1
    currentPoint += initPoint
    dayIndex += 1
    print("dayIndex, CurrentPoint = ", dayIndex, currentPoint)
}

print(dayIndex)
