//
//  CLIprac1.swift
//  CLI_FileManaging
//
//  Created by Kyus'lee on 2022/06/06.
//

import Foundation
// fileの数字を読み、配列として扱ってみよう
let filemanager = FileManager.default
let currentPath = filemanager.currentDirectoryPath
var text = [String]()

func check() {
    guard CommandLine.arguments.count == 3 else {
        // commandlineのargumentが3個であるか否かをcheck
        // CommandLine.arguments[0]は、実行しようとするmain　fileになる
        // つまり、引数が2つであるかをここで確認するのである
        print("""
        This tool make a new file separated the words on different lines each Japanese period(。).
        This tool need two arguments.
        - examaple: swift script.swift input.txt output.txt
          argument 0: script file name
          argument 1: input file name
          argument 2: output file name
        """)
        exit(0)
    }
}

// 入力受け入れる間数
// 引数が複数であるため、for文を用いて配列に入れるようにした
func input() {
    for i in 1...CommandLine.arguments.count - 1 {
        let fileName = currentPath + "/" + CommandLine.arguments[i]
        let inputFile = try? String(contentsOfFile: fileName, encoding: String.Encoding.utf8)
        
        guard let validText = inputFile else {
            print("input file is not found.")
            return
        }
        
        if i == 1 {
            let trimmingText = validText.replacingOccurrences(of: "\n", with: " ")
            // 改行文字を空白に変えた！
            text.append(trimmingText)
            continue
        }

        text.append(validText)
    }
}

//// fileに出力する間数
//func output() {
////    text = text.split(whereSeparator: { $0 == "。" }).joined(separator: "。\n")
//    //フルパスでなくても、1) ./hoge.txt　2) hoge.txt でもcurrentDirectory直下にファイルが作成される
//    let outputFileName = currentPath + "/" + CommandLine.arguments[3]
//    for i in 1...CommandLine.arguments.count - 2 {
//        do {
//            try text[i].write(toFile: outputFileName, atomically: true, encoding: String.Encoding.utf8)
//        } catch let failure {
//            print("write file failed")
//            print(failure)
//        }
//    }
//}


check()
input()

// okay!
var intCard = Array(repeating: Array(repeating: 0, count: 3), count: 3)
var splitArray = text[0].split(separator: " ").map { Int(String($0))! }
var count = 3

for i in 0..<splitArray.count {
    intCard[i / count][i % count] = splitArray[i]
}

//okay!
var intNumbers = text[1].split(separator: " ").map { Int(String($0))! }

print(intCard)
print(intNumbers)

//ビンゴができる最短の回数を求める
typealias Locate = (row: Int, column: Int)
var checkingCount = 0
var finded = Array(repeating: Array(repeating: false, count: 3), count: 3)
var visited = Array(repeating: Array(repeating: false, count: 3), count: 3)
var directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)] //東西南北
var isBingo = false

for currentNum in intNumbers {
    checkingCount += 1
    findingNum(currentNum)

    if isBingo {
        break
    }
}

print(isBingo ? "答えは: \(checkingCount)" : "Cannot Find Bingo!")

func findingNum(_ target: Int) {
    for row in 0..<3 {
        for column in 0..<3 {
            if intCard[row][column] == target {
                finded[row][column] = true

                if findingBingo(row, column) {
                    isBingo = true
                }
                return
            }
        }
    }
}

func findingBingo(_ row: Int, _ column: Int) -> Bool {
    var columnCount = 0
    var rowCount = 0
    
    for curColumn in 0..<3 {
        if finded[row][curColumn] {
            columnCount += 1
        }
        
        if columnCount == 3 {
            return true
        }
    }
    
    for curRow in 0..<3 {
        if finded[curRow][column] {
            rowCount += 1
        }
        
        if rowCount == 3 {
            return true
        }
    }

    return false
}
//
//
//// 🌈考察1: txtファイル上の改行は通常\nの文字として格納されることにきづいた
////[["1 3 5\n7 9 11\n13 15 17"], ["1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20"]]が出力される。
//
////check()
////input()
////print(text)
////print(type(of: text)) // String
////
////// 🌈考察2: fileに
////// 123456789
////// 987654321
////// のように改行を含めた文字が書いてあるとすると、出力されるのも同じく
////// 123456789
////// 987654321 が出力される
//
//
