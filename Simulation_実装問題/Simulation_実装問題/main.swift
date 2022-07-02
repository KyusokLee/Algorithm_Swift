//
//  main.swift
//  Simulation_実装問題
//
//  Created by Kyus'lee on 2022/06/02.
//

import Foundation



//🔥Error Handling

// func availableToEnterCheck() と func checkValidIssueUpdate()が "Undefined Symbol" エラーになった‼️
// -> 理由: 参照が正しくないってこと



//📝Dictionary 練習
//var pracDict = [String: [Int]]()
//pracDict["a"] = [1, 2, 3]
//pracDict["b"] = [4, 5, 6]
//print(pracDict)
//
//pracDict.removeValue(forKey: "a") // 指定したkeyの key-value対を削除する
//print(pracDict)

////📝 inout Func 練習
//
//let a = 2
//if a == 2 {
//    print(pracFunc())
//}
//
//func pracFunc() -> String {
//    var startTimeDict = [String: [Int]]()
//    var endTimeDict = [String: [Int]]()
//    var result = ""
//
//    var input = readLine()
//    while input != "finish" {
//        // 人の名前, 命令Type, start 時間, end 時間
//        let value1 = input!.split(separator: " ").map { String($0) }
//
//        if value1[1] == "time" {
//            let (startTime, endTime) = (value1[2], value1[3])
//
//            if relatedToTimeOne(value1[0], startTime, endTime) {
//                print(startTimeDict[value1[0]]!)
//                print(endTimeDict[value1[0]]!)
//                result += "success to append the time\n"
//            } else {
//                result += "it is not avaiable time set\n"
//            }
//
//
//        } else if value1[1] == "cancel" {
//            if cancel(value1[0], &startTimeDict, &endTimeDict) {
//                print(startTimeDict[value1[0]] ?? "No data")
//                print(endTimeDict[value1[0]] ?? "No data")
//                result += "success to cancel\n"
//            } else {
//                result += "it is not available to cancel\n"
//            }
//        }
//
//        input = readLine()
//    }
//
//    func relatedToTimeOne(_ targetPerson: String, _ startTimeData: String, _ endTimeData: String) -> Bool {
//        let startTimeSplit = startTimeData.split(separator: ":").map { Int(String($0))! }
//        let endTimeSplit = endTimeData.split(separator: ":").map { Int(String($0))! }
//
//        print(startTimeSplit)
//        print(endTimeSplit)
//
//        guard checkTime(startTimeSplit[0], startTimeSplit[1], startTimeSplit[2]) else {
//            return false
//        }
//
//        guard checkTime(endTimeSplit[0], endTimeSplit[1], endTimeSplit[2]) else {
//            return false
//        }
//
//        startTimeDict[targetPerson] = startTimeSplit
//        endTimeDict[targetPerson] = endTimeSplit
//
//        return true
//    }
//
//    func cancel(_ targetPerson: String, _ targetStartDict: inout [String: [Int]], _ targetEndDict: inout [String: [Int]]) -> Bool {
//        if targetStartDict[targetPerson] == nil {
//            return false
//        } else {
//            if targetEndDict[targetPerson] == nil {
//                return false
//            } else {
//                targetStartDict.removeValue(forKey: targetPerson)
//                targetEndDict.removeValue(forKey: targetPerson)
//                return true
//            }
//        }
//    }
//
//    func checkTime(_ hour: Int, _ minute: Int, _ sec: Int) -> Bool {
//        if hour < 0 || hour >= 24 || minute < 0 || minute >= 60 || sec < 0 || sec >= 60 {
//            return false
//        }
//
//        return true
//    }
//
//    if result != "" {
//        result.removeLast()
//    }
//
//    return result
//}
