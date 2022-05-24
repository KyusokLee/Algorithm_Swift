//
//  kakao_2021_Internship(数字と英単語).swift
//  文字列
//
//  Created by Kyus'lee on 2022/05/24.
//

import Foundation
//kakao 2021 internship test
//1. (数字文字列と英単語) 重要度: 🎖🎖🎖🎖🎖
// 🎖文字列
// dropFirst(length)の利用

// Runtime Errorになったコード -> 理由: 与えられるデータ数の上限が2000000000であるため
let string = readLine()!
print(stringToInt(string))

func stringToInt(_ str: String) -> Int {
    if let isIntString = Int(str) {
        return isIntString
    }

    let dictionary = ["one": 1, "two": 2, "three": 3, "four": 4, "five": 5, "six": 6, "seven": 7, "eight": 8, "nine": 9, "zero": 0]
    var targetString = str
    var result = ""

    while !targetString.isEmpty {
        if let intStr = Int(String(targetString.first!)) {
            result += String(intStr)
            targetString.removeFirst()
        } else {
            for i in dictionary.keys {
                if targetString.hasPrefix(i) {
                    result += String(dictionary[i]!)
                    targetString = String(targetString.dropFirst(i.count))
                    break
                }
            }
        }
    }

    return Int(result)!
}

//replacingOccurrencesの活用 -> 処理が早い
func stringToInt1(_ str: String) -> Int {
    if let isIntString = Int(str) {
        return isIntString
    }
    
    let changeOne = str.replacingOccurrences(of: "zero", with: "0")
        .replacingOccurrences(of: "one", with: "1")
        .replacingOccurrences(of: "two", with: "2")
        .replacingOccurrences(of: "three", with: "3")
        .replacingOccurrences(of: "four", with: "4")
        .replacingOccurrences(of: "five", with: "5")
        .replacingOccurrences(of: "six", with: "6")
        .replacingOccurrences(of: "seven", with: "7")
        .replacingOccurrences(of: "eight", with: "8")
        .replacingOccurrences(of: "nine", with: "9")

    return Int(changeOne)!
}

print(stringToInt1(readLine()!))
