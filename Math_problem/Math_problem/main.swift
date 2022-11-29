//
//  main.swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/05/28.
//

import Foundation
////Atcoder Beginners Contest 254
////D. Together Square
//// 🎖Math (🔥Very Hard)
//
//// 時間超過になってしまったコード
//let data = Int(readLine()!)!
//var checkArray = Array(repeating: 0, count: data + 1)
//var count = 0
//
//for i in 1...data {
//    let input = i / sieveOfEratosThenes(i)
//    checkArray[i] = input
//}
//
//for i in 1...data {
//    for j in 1...data {
//        if checkArray[i] == checkArray[j] {
//            count += 1
//        }
//    }
//}
//
//print(count)
//
//// エラトステネスの篩アルゴリズムを用いて、numの約数のうち最大の平方数を求める   (--> 素数を探す最も効果的なアルゴリズム)
//func sieveOfEratosThenes(_ num: Int) -> Int {
////    var divisor = Array(repeating: false, count: num + 1)
//    var maxValue = 1
//
//    //約数の中で、平方数を求める方法
//    if num >= 4 {
//        for i in 2...Int(sqrt(Double(num))) {
//            if num % (i * i) == 0 && (i * i <= num) {
//                maxValue = max(maxValue, i * i)
//            }
//        }
//    }
//
////    let maxSquareDivisor = divisor.enumerated().filter { $0.1 == true }.map { Int($0.0) }.last!
////    // (約数の中の平方数になる値の個数, maxValue)を出力
////
////    return maxSquareDivisor
//    return maxValue
//}
//
//
//
//
//
//
//
//// 方法3
//let n = Int(readLine()!)!
//var result = 0
//
//for i in 1...n {
//    var j = i
//    var d = 2
//    while d * d <= j {
//        while j % (d * d) == 0 {
//            j /= d * d
//        }
//        d += 1
//    }
//    d = 1
//
//    while j * d * d <= n {
//        result += 1
//        d += 1
//    }
//}
//print(result)



//// 範囲内の平方数を求める
//func sieveOfEratosThenes(_ num: Int) {
//    var isSquareNum: [Bool] = Array(repeating: false, count: num + 1)
//    isSquareNum[0] = false
//    isSquareNum[1] = true
//
//    if num >= 4 {
//        for i in 2...Int(sqrt(Double(num))) {
//            isSquareNum[i * i] = true
//        }
//    }
//
//    let maxNotPrime = isSquareNum.enumerated().filter { $0.1 == true }.map { Int($0.0) }.max()!
//    print(maxNotPrime)
//}

//BaekJoon n.2609(最大公約数と最小公倍数)
// 🎖Math
// 入力される２個の自然数から、最大公約数と最小公倍数を出力
// １行目: 最大公約数 (gcd)
// 2行目: 最小公倍数 (lcm)

//// 最大公約数を求める間数
//func gcd(_ a: Int, _ b: Int) -> Int {
//    var num1 = a
//    var num2 = b
//    // 余り
//    let remainder = num1 % num2
//
//    if remainder == 0 {
//        return num2
//    } else {
//        return gcd(num2, remainder)
//    }
//}
//
//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//let (num1, num2) = (input[0], input[1])
//var gcdResult = gcd(num1, num2)
//var result = ""
//
//result += "\(gcdResult)\n"
//result += "\(num1 * num2 / gcdResult)"
//print(result)

////BaekJoon n.10870(フィボナッチ数5)
//// 🎖Math
//// 再帰関数を用いた方法
//
//let num = Int(readLine()!)!
//
//func fibonacci(_ num: Int) -> Int {
//    if num < 2 {
//        return num
//    }
//
//    return fibonacci(num - 1) + fibonacci(num - 2)
//}
//
//print(fibonacci(num))


////BaekJoon n.2749(フィボナッチ数3) 難易度: 🔥🔥🔥
//// 🎖Math
//// 大数が入力されるため、計算量を上手く減らす必要がある
//let num = Int(readLine()!)!
//let divideNum = 1000000
//
////Memoizationを用いる
//// メモリ超過になってしまった (BaekJoon サイトでswiftに対して計算量の余裕を増やしていないのが原因であった)
//func fibonacci3(_ num: Int) -> Int {
//    if num == 0 {
//        return 0
//    }
//    if num == 1 {
//        return 1
//    }
//
//    var fiboArr = [0, 1]
//
//    while fiboArr.count <= num {
//        fiboArr.append((fiboArr[fiboArr.count - 1] + fiboArr[fiboArr.count - 2]) % divideNum)
//    }
//    return fiboArr[num]
//}
//
//print(fibonacci3(num))

//// メモリ超過にならないコード
//var arr = Array(repeating: 0, count: 1_500_001)
//arr[0] = 0
//arr[1] = 1
//for i in 2...1_500_000{
//    arr[i] = (arr[i-1] + arr[i-2])%1_000_000
//}
//let n = Int(readLine()!)!
//print(arr[n%1_500_000])

////BaekJoon n.2748(フィボナッチ数2) 難易度: 🎖
//// 🎖Math
//let num = Int(readLine()!)!
//
//func fibonacci2(_ n: Int) -> Int {
//    var numArr = [0, 1, 1]
//
//    for i in 0...n {
//        if i == 0 || i == 1 || i == 2 {
//            continue
//        } else {
//            numArr.append(numArr[i - 1] + numArr[i - 2])
//        }
//    }
//
//    return numArr[n]
//}
//
//print(fibonacci2(num))

////BaekJoon n.2581(素数) 難易度: 🎖🎖
//// 🎖Math (素数探しの問題)
//
//let minNum = Int(readLine()!)!
//let maxNum = Int(readLine()!)!
//var numArr = [Int]()
//var sum = 0
//var minPrimeNum = 0
//
//// MARK: 🔥素数探しの間数
//func isPrime(_ num: Int) -> Bool {
//    if num < 4 {
//        return num == 1 ? false : true
//    }
//
//    for i in 2...Int(sqrt(Double(num))) {
//        if num % i == 0 {
//            return false
//        }
//    }
//    return true
//}
//
//for i in stride(from: minNum, through: maxNum, by: 1) {
//    if isPrime(i) {
//        numArr.append(i)
//    }
//}
//
//if numArr.isEmpty {
//    print(-1)
//} else {
//    sum = numArr.reduce(0, +)
//    minPrimeNum = numArr.min()!
//    print(sum)
//    print(minPrimeNum)
//}

// ただ、思いついた問題
// 問題 → 7以上7777777以下の7の倍数を全て書き出したとき、数字「7」は何回現れるか。
// 効率的な計算量で正解を求めたい
// 正解→777784

func isMultipleOfSeven(_ num: Int) -> Bool {
    // 7の倍数かをcheck
    if num % 7 == 0 {
        return true
    }
    return false
}

// 数字に7があるかどうかの確認
// 7の倍数のときだけ、このメソッドが呼び出されるようにしたい
func hasSevenInNum(_ num: Int) -> Int {
    guard num % 10 != num else {
        if num == 7 {
            return 1
        } else {
            return 0
        }
    }

    var target = num
    var count = 0

    //Check
    while target != 0 {
        //　1の桁から調べていき、10ずつ割ってtarget Numを小さくする
        let compareNum = target % 10

        if compareNum == 7 {
            count += 1
        }

        // 一桁の数字であるとき
        if target % 10 == target {
            break
        } else {
            target /= 10
        }
    }

    return count
}

var resultCount = 0

// 配列を設けるより、もっと早い
// こうすることで、簡単に全部7の倍数になる
for i in stride(from: 7, through: 7777777, by: 7) {
    resultCount += hasSevenInNum(i)
}

print(resultCount)

