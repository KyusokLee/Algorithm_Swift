//
//  Fizz Buzz practice.swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/06/08.
//

import Foundation
// コードの処理時間の測定
// この間数のblockで囲まれている範囲の処理時間を測定する。
// 注意点: 同じ入力値に対して、一定の時間を示すわけではない。多少の時間のずれがあることに注意。
func processTime(blockFunction: () -> ()) {
    let startTime = CFAbsoluteTimeGetCurrent()
    blockFunction()

    let processTime = CFAbsoluteTimeGetCurrent() - startTime
    print("Process Time = \(processTime)")
}

processTime {
    // FizzBuzz 応用問題
    let data = readLine()!.split(separator: " ")
    let targetNum = Int(data.last!)! //ターゲット数値
    var dictionaryFizzBuzz = [Int: String]()
    // Dictionaryの方が　時間計算量 O(1)で短いから利用した
    var result = ""
    //配列を用いるより、Stringに足す仕組み 時間計算量を考慮

    for i in 0..<data.count - 1 {
        let compareStr = data[i]
        if let intNum = compareStr.first!.wholeNumberValue {
            let dicStr = compareStr.split(separator: ":")
            dictionaryFizzBuzz[intNum] = String(dicStr.last!)
        }
    }

    let sortedDictionary = dictionaryFizzBuzz.filter { $0.0 != 1 }.sorted{ $0.0 < $1.0 }
    // 1があると無限になるため、1をfilteringする必要がある
    // 注意する点は、Dictionaryではなく、Array<(key:Int, value: String)>型である

    //⚠️⁉️DictionaryをそのままDictionaryとして変換する簡単な方法はないのか。。？


    //Dictionaryは出力するたびにkey, valueのindexが異なる。
    // 問題でa[i] (= 数字の方)が小さい準に対応する文字列を連結して対応すると設定したため、数字が格納されるkeyを昇順にsorted

    if fizzbuzzCheck(targetNum) {
        print(result)
    } else {
        print(targetNum)
    }

    //文字の連結を行う間数 (数字が小さい順から連結させていく)
    func fizzbuzzCheck(_ num: Int) -> Bool {
        guard num > 1 else {
            return false
        }

        var compareNum = num
        var isFind = false

        while compareNum > 0 {
            var noMoreFind = true
            for i in sortedDictionary {
                if compareNum % i.key == 0 {
                    result += i.value
                    compareNum /= i.key
                    noMoreFind = false
                    break
                }
            }

            if noMoreFind {
                break
            } else {
                if !isFind {
                    // すでにtrueなのに、true処理を継続的に行うことを事前に防ぐ
                    isFind = true
                }
                continue
            }
        }

        return isFind
    }
}

//🌈考察: filterを使用した後、sortedをする場合の処理時間計算:
// 1. filter の後、sortedをした場合:
//3:wow 4:lol 6:if 5832
//wowwowwowwowwowwowlol
//Process Time = 1.2396140098571777

// 2. filter 使用せずに処理した場合:
//3:wow 4:lol 6:if 5832
//wowwowwowwowwowwowlol
//Process Time = 1.0740220546722412

//3:wow 4:lol 6:if 1:why 5832
//wowwowwowwowwowwowlol
//Process Time = 0.6190289258956909

// 結果: そこまで大きな差はなかった// FizzBuzz 応用問題


let data = readLine()!.split(separator: " ")
let targetNum = Int(data.last!)! //ターゲット数値
var dictionaryFizzBuzz = [Int: String]()
// Dictionaryの方が　時間計算量 O(1)で短いから利用した
var result = ""
//配列を用いるより、Stringに足す仕組み 時間計算量を考慮

for i in 0..<data.count - 1 {
    let compareStr = data[i]
    if let intNum = compareStr.first!.wholeNumberValue {
        let dicStr = compareStr.split(separator: ":")
        dictionaryFizzBuzz[intNum] = String(dicStr.last!)
    }
}

var sortedDictionary = dictionaryFizzBuzz.filter { $0.0 != 1 }.sorted{ $0.0 < $1.0 }
// 1があると無限になるため、1をfilteringする必要がある
// 注意する点は、Dictionaryではなく、Array<(key:Int, value: String)>型である

//⚠️⁉️DictionaryをそのままDictionaryとして変換する簡単な方法はないのか。。？


//Dictionaryは出力するたびにkey, valueのindexが異なる。
// 問題でa[i] (= 数字の方)が小さい準に対応する文字列を連結して対応すると設定したため、数字が格納されるkeyを昇順にsorted

if fizzbuzzCheck(targetNum) {
    print(result)
} else {
    print(targetNum)
}

//文字の連結を行う間数 (数字が小さい順から連結させていく)
func fizzbuzzCheck(_ num: Int) -> Bool {
    guard num > 1 else {
        return false
    }

    var compareNum = num
    var isFind = false

    while compareNum > 0 {
        var noMoreFind = true
        for i in sortedDictionary {
            if compareNum % i.key == 0 {
                result += i.value
                compareNum /= i.key
                noMoreFind = false
                break
            }
        }

        if noMoreFind {
            break
        } else {
            if !isFind {
                // すでにtrueなのに、true処理を継続的に行うことを事前に防ぐ
                isFind = true
            }
            continue
        }
    }

    return isFind
}
