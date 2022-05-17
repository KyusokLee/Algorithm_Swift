//
//  File.swift
//  BinarySearch_Algorithm
//
//  Created by Kyus'lee on 2022/05/17.
//

import Foundation
//BaekJoon n.1450 (ナップサック問題) 重要度: 🎖🎖🎖🎖🎖🎖🎖🎖🎖🎖🎖
// 🎖‼️HARD!! KnapSack + 二分探索 + meet in the middle方法

let data = readLine()!.split(separator: " ").map { Int(String($0))! }
let (itemNums, weightLimit) = (data[0], data[1])
let itemArray = readLine()!.split(separator: " ").map { Int(String($0))! }
// itemのweightが同じであっても、それぞれのitemは違う種類であるため、同じ扱いにしないことを注意
// 何もカバンに入れてなくても weightLimitの以下であればそのケースも計算に入れること
var result = 0

var sumArrayA = [Int]()
var sumArrayB = [Int]()
//奇数であれば、sumArrayAの方が探索の範囲が小さい ex) 5つの要素であれば、 1 2 / sumB-> 3 4 5
partition(0, itemArray.count / 2, &sumArrayA, 0) // 例: 5個のアイテムがあるとすると、 -> to: 2になる
partition(itemArray.count / 2, itemArray.count, &sumArrayB, 0) //例: 5個のアイテムがあるとすると、-> from: 2になる
sumArrayB.sort() //二分探索は、sortしなくては有効ではないアルゴリズムであるため、昇順にソートしておく

for valueA in sumArrayA {
    let availableToPut = binarySearchUpperBounds(targetNum: weightLimit - valueA, sumArrayB)
    result += availableToPut
}

print(result)

//🔥この関数の実装がかなり難しかった。。
// 最初に入力された配列を２つに分割して、実行を行うことで、オーダー記法の短縮を図ることができる
// DFSアルゴリズムの一環
func partition(_ from: Int, _ to: Int, _ array: inout [Int], _ sum: Int) {
    guard sum <= weightLimit else {
        return
    }
    guard from < to else {
        //from が　to を超えないように設定する
        array.append(sum)
        return
    }
    // partition間数の中で、再び、二つの間数を呼び出し、一度の間数の呼び出しで分割されることになる
    partition(from + 1, to, &array, sum)
    partition(from + 1, to, &array, sum + itemArray[from])
}

//二分探索
// Partition 処理を行った後、片方の配列で部分和を選択肢、残りの配列で何個をカバンに入れるかを数える
func binarySearchUpperBounds(targetNum: Int, _ targetArray: [Int]) -> Int {
    var start = 0
    var end = targetArray.count - 1
    
    while start <= end {
        // targetArrayは、昇順にソートされたため、startがendまで探ることができたなら、それが意味するのが end Index以下の全ての要素をカバンに入れることができる意味
        // 結局startが　end と同じになるまでずっと繰り返されるため、start自体がカバンに入れるcaseの数を指す
        let middle = (start + end) / 2
        if targetNum < targetArray[middle] {
            end = middle + 1
        } else {
            // 探そうとしているtargetNumが　targetArray[middle]の値と同値であるか、もしくは大きいなら、start = middle + 1
            // つまり、start自体がカバンに入れるアイテムの数である
            start = middle + 1
        }
    }
    
    return start
}
