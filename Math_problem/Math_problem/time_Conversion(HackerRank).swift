//
//  time_Conversion(HackerRank).swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/05/28.
//

import Foundation
//HackerRank
//🎖Time Conversion


// hasSuffixとjoinedの練習
//例1)
// input: 07:05:45PM
// output: 19:05:45

//例2)
// input: 12:01:00AM
// output: 00:01:00

// コードの処理時間の測定
func processTime(blockFunction: () -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    blockFunction()

    let processTime = CFAbsoluteTimeGetCurrent() - startTime
    print("Process Time = \(processTime)")
}

processTime {
    // 方法2: removeLastを用いた "AM" or "PM"文字 一括削除 -> こっちの方が早かった
    // 🌈考察: 削除する文字の数を既にわかっているのであれば、removeLast()を用いて一括で削除処理を行った方がいい
    func timeConversion(s: String) -> String {
        var changeString = s.split(separator: ":").map { String($0) }
        
        if changeString[2].hasSuffix("AM") {
            //AMの場合
            if changeString[0] == "12" {
                changeString[0] = "00"
            }
        } else {
            //PMの場合
            if changeString[0] != "12" {
                changeString[0] = String(Int(changeString[0])! + 12)
            }
        }
        
        changeString[2].removeLast()
        changeString[2].removeLast()
        
        return changeString.joined(separator: ":")
    }

    let inputString = readLine()!
    print(timeConversion(s: inputString))
}


// 方法1: replacingOccurrencesを用いた変換
func timeConversion1(s: String) -> String {
    var changeString = s.split(separator: ":").map { String($0) }
    
    if changeString[2].hasSuffix("AM") {
        //AMの場合
        if changeString[0] == "12" {
            changeString[0] = "00"
        }
        changeString[2] = changeString[2].replacingOccurrences(of: "AM", with: "")
    } else {
        //PMの場合
        if changeString[0] != "12" {
            changeString[0] = String(Int(changeString[0])! + 12)
        }
        changeString[2] = changeString[2].replacingOccurrences(of: "PM", with: "")
    }
    
    return changeString.joined(separator: ":")
}

// 方法2: removeLastを用いた "AM" or "PM"文字 一括削除 -> こっちの方が早かった
// 🌈考察: 削除する文字の数を既にわかっているのであれば、removeLast()を用いて一括で削除処理を行った方がいい
func timeConversion(s: String) -> String {
    var changeString = s.split(separator: ":").map { String($0) }
    
    if changeString[2].hasSuffix("AM") {
        //AMの場合
        if changeString[0] == "12" {
            changeString[0] = "00"
        }
    } else {
        //PMの場合
        if changeString[0] != "12" {
            changeString[0] = String(Int(changeString[0])! + 12)
        }
    }
    
    changeString[2].removeLast()
    changeString[2].removeLast()
    
    return changeString.joined(separator: ":")
}
