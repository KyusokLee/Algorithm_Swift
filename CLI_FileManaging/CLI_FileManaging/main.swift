//
//  main.swift
//  CLI_FileManaging
//
//  Created by Kyus'lee on 2022/05/29.
//

import Foundation
////配列の練習
//// ["1 3 5\n7 9 11\n13 15 17"]があるとする
//// \\n で　\nという改行文字を消すことができた
//let data = readLine()!.replacingOccurrences(of: "\\n", with: " ")
//print(data)
//let data1 = readLine()!.components(separatedBy: "\\n") // 改行文字を消すのに便利なのは components(separatedBy)だった
//print(data1)
//print(type(of: data1))
//
//let data2 = readLine()!.components(separatedBy: "\\n")
//var intArray = [[Int]]()
//for i in 0..<data2.count {
//    let changeInt = data2[i].split(separator: " ").map { Int(String($0))! }
//    intArray += [changeInt]
//}
//print(intArray)
//print(intArray[0][2])
////let data2 = readLine()!.split(separator: "\n") // split(separator:) は、characterを変換するメッソドである (一つの文字)
////print(data2)

//// logic
////1. 与えられる入力値をspaceを基準に分ける
////2. 一番最後の数字は比較を行うtargetNum
////3. 効率的な計算量を考えてdictionaryを用いる O(1)
////4. for文は、targetNumを意識して count - 1にした
////5. String型の数字をwholeNumberValueを用いてInt型に一括変換
////6. 数字であるなら、最初のdataで空白を基準に分けたStringを再び":"を基準に分ける
////  (:の前の方をdictionaryのkeyに、　:の後ろは valueに)
////7. 問題文でa[i]とs[i]は全て異なると設定したので、dictionaryの nil チェックを省略した
////8. (key, value)のdictionaryを昇順にsortする。(数字があるkeyが基準)
////9. fizzbuzzCheck()を用いてtargetNumをsortedDicrionaryのkeyで割る
//
//let data = readLine()!.split(separator: " ")
//let targetNum = Int(data.last!)! //ターゲット数値
//var dictionaryFizzBuzz = [Int: String]()
//// Dictionaryの方が　時間計算量 O(1)で短いから利用した
//var result = ""
////配列を用いるより、Stringに足す仕組み 時間計算量を考慮
//
//for i in 0..<data.count - 1 {
//    let compareStr = data[i]
//    if let intNum = compareStr.first!.wholeNumberValue {
//        let dicStr = compareStr.split(separator: ":")
//        dictionaryFizzBuzz[intNum] = String(dicStr.last!)
//    }
//}
//
//var sortedDictionary = dictionaryFizzBuzz.sorted{ $0.0 < $1.0 }
////Dictionaryは出力するたびにkey, valueのindexが異なる。
//// 問題でa[i] (= 数字の方)が小さい準に対応する文字列を連結して対応すると設定したため、数字が格納されるkeyを昇順にsorted
//
//if fizzbuzzCheck(targetNum) {
//    print(result)
//} else {
//    print(targetNum)
//}
//
////文字の連結を行う間数 (数字が小さい順から連結させていく)
//func fizzbuzzCheck(_ num: Int) -> Bool {
//    var compareNum = num
//    var isFind = false
//
//    while compareNum > 0 {
//        var noMoreFind = true
//        for i in sortedDictionary {
//            if compareNum % i.key == 0 {
//                result += i.value
//                compareNum /= i.key
//                noMoreFind = false
//                break
//            }
//        }
//
//        if noMoreFind {
//            break
//        } else {
//            isFind = true
//            continue
//        }
//    }
//
//    return isFind
//}

//// fileの数字を読み、配列として扱ってみよう
//let filemanager = FileManager.default
//let currentPath = filemanager.currentDirectoryPath
//var text = [String]()
//
////コマンドライン引数の取得方法
//for i in 1 ..< CommandLine.argc {
//    let index = Int(i)
//    print(CommandLine.arguments[index])
//}
//
//func check() {
//    guard CommandLine.arguments.count == 3 else {
//        // commandlineのargumentが3個であるか否かをcheck
//        // CommandLine.arguments[0]は、実行しようとするmain　fileになる
//        // つまり、引数が2つであるかをここで確認するのである
//        print("error!")
//        exit(1)
//    }
//}
//
//// 入力受け入れる間数
//// 引数が複数であるため、for文を用いて配列に入れるようにした
//func input() {
//    for i in 1...CommandLine.arguments.count - 1 {
//        let fileName = currentPath + "/" + CommandLine.arguments[i]
//        let inputFile = try? String(contentsOfFile: fileName, encoding: String.Encoding.utf8)
//
//        guard let validText = inputFile else {
//            print("input file is not found.")
//            return
//        }
//
//        if i == 1 {
//            let trimmingText = validText.replacingOccurrences(of: "\n", with: " ")
//            // 改行文字を空白に変えた！
//            text.append(trimmingText)
//            continue
//        }
//
//        text.append(validText)
//    }
//}

//query, Endpointを用いて、HTTP get 通信を行う
// ⚠️途中の段階
public struct server: Codable {
    let seed: String
    let n: Int
}

let filemanager = FileManager.default
let currentPath = filemanager.currentDirectoryPath
var seed: String = ""
var n: Int = 0

func check() {
    guard CommandLine.arguments.count == 3 else {
        // commandlineのargumentが3個であるか否かをcheck
        // CommandLine.arguments[0]は、実行しようとするmain　fileになる
        // つまり、引数が2つであるかをここで確認するのである
        print("error!")
        exit(1)
    }
}

// 入力を受け入れる間数
func input() {
    for i in 1...CommandLine.arguments.count - 1 {
        let checkOne = CommandLine.arguments[i]
        if i == 1 {
            if Int(checkOne) != nil {
                // Intであれば error
                print("error!")
                exit(1)
            } else {
                seed = checkOne
            }
        } else if i == 2 {
            if let intOne = Int(checkOne) {
                n = intOne
            } else {
                print("error!")
                exit(1)
            }

            print(f(n))
        }
    }
}

func f(_ num: Int) -> Int {
    if num % 2 == 0 {
        return f(num - 1) + f(num - 2) + f(num - 3) + f(num - 4)
    } else {
        return num
    }
}

func askServer(_ num: Int) {

}

check()
input()


//APIのGet Request

private func get() {
    let urlString = "http://challenge-server.code-check.io/"
    let endPoint = "api/recursive/ask"
    let connectedUrl = urlString + endPoint
    
    var urlComponents = URLComponents(string: connectedUrl)!  //URLComponentsでURLを生成
    urlComponents.queryItems = [
        URLQueryItem(name: "seed", value: seed),
        URLQueryItem(name: "n", value: String(n))
    ]
    var request = URLRequest(url: urlComponents.url!)

    guard let url = URLComponents(string: connectedUrl) else {
        return
    }

    // HTTPメソッドを実行
    let task = URLSession.shared.dataTask(with: url.url!) {(data, response, error) in
        if (error != nil) {
            print(error!.localizedDescription)
        }

        guard let _data = data else {
            // dataがnilだったら -> return
            return
        }

        // JSONデコード
        let users = try! JSONDecoder().decode(server.self, from: _data)
        print("seed:\(users.seed) n:\(users.n)")
    }

    task.resume()
}

get()




//let data = Int(readLine()!)!
//if data % 2 == 0 {
//    print("true")
//} else {
//    print(data)
//}
//
//
//func f(_ num: Int) -> Int {
//    if num % 2 == 0 {
//        return f(num - 1) + f(num - 2) + f(num - 3) + f(num - 4)
//    } else {
//        return 0
////        return askServer(num)
//    }
//}
