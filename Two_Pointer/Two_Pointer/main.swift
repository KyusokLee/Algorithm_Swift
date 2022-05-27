//
//  main.swift
//  Two_Pointer
//
//  Created by Kyus'lee on 2022/05/27.
//

import Foundation


////  ***現在の環境でのfileの受け取り***
//let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
//FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
//let fileHandle = FileHandle(forWritingAtPath: stdout)!
//
//guard let arrCount = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
//else { fatalError("Bad input") }
//
//var arr = [Int]()
//
//for _ in 1...arrCount {
//    guard let arrItem = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
//    else { fatalError("Bad input") }
//
//    arr.append(arrItem)
//}
//
//guard arr.count == arrCount else { fatalError("Bad input") }
//
//let result = 0
//
//fileHandle.write(String(result).data(using: .utf8)!)
//fileHandle.write("\n".data(using: .utf8)!)

////  ***処理時間の測定 ***
//func processTime(blockFunction: () -> ()) {
//    let startTime = CFAbsoluteTimeGetCurrent()
//    blockFunction()
//
//    let processTime = CFAbsoluteTimeGetCurrent() - startTime
//    print("Process Time = \(processTime)")
//}

