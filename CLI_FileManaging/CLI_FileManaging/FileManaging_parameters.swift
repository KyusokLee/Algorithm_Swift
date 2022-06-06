//
//  FileManaging_parameters.swift
//  CLI_FileManaging
//
//  Created by Kyus'lee on 2022/05/29.
//

import Foundation
// CLIを用いた実行の場合、fileを引数として受け取るコード
// 練習1
// 必ず、current Directoryの設定が必要。
// 実行しようとするcurrent Directoryのpathにinputのファイルがなければならない
// また、output fileは　current Directory pathに生成される


// FileManagerは、foundation のクラスである

let filemanager = FileManager.default // instance
let currentPath = filemanager.currentDirectoryPath
var text = ""

func check() {
    guard CommandLine.arguments.count == 3 else {
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
func input() {
    let fileName = currentPath + "/" + CommandLine.arguments[1]
    let inputFile = try? String(contentsOfFile: fileName, encoding: String.Encoding.utf8)
    guard let validText = inputFile else {
        print("input file is not found.")
        return
    }
    text = validText
}

// fileに出力する間数
func output() {
    text = text.split(whereSeparator: { $0 == "。" }).joined(separator: "。\n")
    //フルパスでなくても、1) ./hoge.txt　2) hoge.txt でもcurrentDirectory直下にファイルが作成される
    let outputFileName = currentPath + "/" + CommandLine.arguments[2]
    do {
        try text.write(toFile: outputFileName, atomically: true, encoding: String.Encoding.utf8)
    } catch let failure {
        print("write file failed")
        print(failure)
    }
}

check()
input()
output()


