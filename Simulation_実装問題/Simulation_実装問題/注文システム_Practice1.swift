//
//  注文システム_Practice1.swift
//  Simulation_実装問題
//
//  Created by Kyus'lee on 2022/06/13.
//

import Foundation
//// レストラン注文システム
//// Step1
//// ここでは、何回入力されるかの制限がないため、"finish"文字列が入力されたら終了になりようにコードを作成した。
////Step1の出力が Step2の入力 (reservedになれる)
//// 在庫0の場合は、注文を受け取らない (reserved)

// step2 と　step3でTLEが発生した (処理時間 Over!)

// 🎖レストラン注文システム
// Step4 -> 会計ボタンを押したら、注文総計を出すシステム
typealias MenuData = (stock: Int, price: Int)
let stepSet = Int(readLine()!)!

if stepSet == 4 {
    print(processStep4())
}

func processStep4() -> String {
    //　Step4: 注文した合計を計算する処理
    // 注文していない料理が提供されることはないことが前提条件
    typealias OrderData4 = (tableNum: Int, menuType: Int)

    let menuTypeNumbers = Int(readLine()!)!
    var menuDataDict = [Int: MenuData]()
    var tableDataDict = [Int: [Int]]()
    var tableCostDict = [Int: Int]()
    var processArray = [OrderData4]()
    var printResult = ""

    // Process: menu情報格納
    for _ in 0..<menuTypeNumbers {
        let menuData = readLine()!.split(separator: " ").map { Int(String($0))! }

        if menuDataDict[menuData[0]] == nil {
            menuDataDict[menuData[0]] = (menuData[1], menuData[2])
        }
    }

    // Process: 注文受付
    // finish が入力されたらプログラム終了
    var receivedCall = readLine()
    while receivedCall != "finish" {
        let makeOrderData = receivedCall!.split(separator: " ").map { String($0) }

        if makeOrderData[0] == "received" {
            let (curTableNum, orderedMenu) = (Int(makeOrderData[2])!, Int(makeOrderData[3])!)
            
            if tableDataDict[curTableNum] == nil {
                // そのテーブルからの初注文である場合
                tableDataDict[curTableNum] = [orderedMenu]
                tableCostDict[curTableNum] = menuDataDict[orderedMenu]!.price
            } else {
                //　すでに注文があるテーブル番号である場合
                tableDataDict[curTableNum]!.append(orderedMenu)
                tableCostDict[curTableNum]! += menuDataDict[orderedMenu]!.price
            }
            menuDataDict[orderedMenu]!.stock -= 1
            processArray.append((curTableNum, orderedMenu))
        } else if makeOrderData[0] == "ready" {
            //Process: 料理を注文したテーブル番号のお客様に料理を提供する (正確にはready段階)
            let (targetTable, targetMenu) = (Int(makeOrderData[1])!, Int(makeOrderData[2])!)
            let processIndex = processArray.firstIndex(where: {$0.menuType == targetMenu} )!
            let tableIndex = tableDataDict[targetTable]!.firstIndex(where: { $0 == targetMenu })!
            processArray.remove(at: processIndex)
            tableDataDict[targetTable]!.remove(at: tableIndex)
        } else if makeOrderData[0] == "check" {
            let checkTable = Int(makeOrderData[1])!
            
            if tableDataDict[checkTable] == nil {
                //テーブルにお客様がいるが、まだ何も注文されていない場合
                tableDataDict[checkTable] = []
                tableCostDict[checkTable] = 0
            }
            
            if tableDataDict[checkTable]!.isEmpty {
                printResult += "\(tableCostDict[checkTable]!)\n"
                tableCostDict[checkTable]! = 0
            } else {
                printResult += "please wait\n"
            }
        }
        
        receivedCall = readLine()
    }

    if printResult != "" {
        printResult.removeLast()
    }
    return printResult
}

//反例
//4
//10
//568735 6984 56789
//518777 8947 38669
//714265 618 53128
//122392 6391 22337
//128793 7556 25860
//430803 2258 6765
//31699 3134 84793
//839101 568 79880
//802400 4332 90640
//901865 6534 45638
//received order 5640 128793
//check 6047
//check 9505
//ready 5640 128793
//received order 9505 802400
//received order 9505 802400
//ready 9505 802400
//check 5640
//ready 9505 802400
//received order 9505 518777
//ready 9505 518777
//received order 9505 122392
//check 5640
//ready 9505 122392
//received order 5640 122392
//ready 5640 122392
//received order 5640 802400
//check 9505
//ready 5640 802400
//received order 6047 802400
//ready 6047 802400
//received order 9505 128793
//received order 6047 802400
//received order 5640 901865
//ready 9505 128793
//ready 6047 802400
//ready 5640 901865
//received order 5640 802400
//ready 5640 802400
//check 9505

// ✍️チャレンジ:  Step1 -> Step2 -> Step3 -> Step4 のような仕組み (🔥全てのStepが全部繋がっている仕組み)
