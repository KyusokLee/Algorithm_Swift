//
//  BFS_reviewSeries_hideSeek.swift
//  BFS_Algorithm
//
//  Created by Kyus'lee on 2022/08/11.
//

import Foundation
// 🔥夏休み集中復習
//BaekJoon n.1697(かくれんぼ) 重要度: 🎖🎖🎖
// 🎖BFS

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (subinLocate, sisterLocate) = (input[0], input[1])
var result = 0

bfs_findingSister(subinLocate)
print(result)

func bfs_findingSister(_ startLocate: Int) {
    var neededVisitQueue = [(startLocate, 0)]
    var visited = Array(repeating: false, count: 100001)
    var index = 0
    visited[startLocate] = true

    while index < neededVisitQueue.count {
        let (currentLocate, time) = neededVisitQueue[index]

        if currentLocate == sisterLocate {
            result = time
            return
        }

        for next in [currentLocate - 1, currentLocate + 1, currentLocate * 2] {
            if next < 0 || next > 100000 {
                continue
            }

            // まだ、訪問してないところであれば
            if !visited[next] {
                visited[next] = true
                neededVisitQueue.append((next, time + 1))
            }
        }

        index += 1
    }
}

BaekJoon n.12851(かくれんぼ2) 重要度: 🎖🎖🎖🎖
 🎖BFS

 訪問した回数のarray, ある場所に着いた時間を格納する arrayを設けることが肝心である。
 つまり、ただの Bool typeの　arrayでも再現はできるが、上記のような方がより効率的に探せる

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (subin, sister) = (input[0], input[1])
var minTimeArr = Array(repeating: -1, count: 100001)
var visitCountArr = Array(repeating: 0, count: 100001)

bfs_findingSister2(subin)
print("\(minTimeArr[sister])\n\(visitCountArr[sister])")

func bfs_findingSister2(_ start: Int) {
    // 間数の外で、timeに関するarrayをすでに設定したため、timeを表す要素をなくしたarrayを作成する
    var neededVisitQueue = [start]
    var index = 0
    minTimeArr[start] = 0
    visitCountArr[start] = 1

    while index < neededVisitQueue.count {
        let currentLocate = neededVisitQueue[index]

        for next in [currentLocate - 1, currentLocate + 1, currentLocate * 2] {
            if next < 0 || next > 100000 {
                 continue
            }

            if minTimeArr[next] == -1 {
                // まだ、visitしてない
                minTimeArr[next] = minTimeArr[currentLocate] + 1
                visitCountArr[next] = visitCountArr[currentLocate]
                neededVisitQueue.append(next)
            } else if minTimeArr[next] == minTimeArr[currentLocate] + 1 {
                // すでに訪問したことのある場所
                //　次に訪問しようとする場所が、現在の位置に着くまでかかった最小時間 + 1秒で着くことが可能であるとき
                // visitCountArr[next] += 1 にするとダメ
                // 4 99の場合を考える
                visitCountArr[next] += visitCountArr[currentLocate]
                // logic: 17という場所に 16から行くとき、 18から行く時のかかる時間が同じだとする
                // つまり、 16 -> 17 、18 -> 17のcaseがあり、17に着く回数は、2回となる。
                // そこで、34に行こうとする場合, 17 * 2 = 34になり、17から着くことが可能である。
                // このとき、ただ + 1　にしてしまうと、17に着く経路は2つなのに、 34に着く経路が1つしかないことになるから、Errorになる
            }

        }

        index += 1
    }
}

BaekJoon n.13549(かくれんぼ3) 重要度: 🎖🎖🎖🎖
 🎖BFS

// 特徴: teleport は0秒,  +1, -1は1秒
let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (subin, sister) = (input[0], input[1])
var minTimeArr = Array(repeating: -1, count: 100001)

bfs_findingSister3(subin)
print(minTimeArr[sister])

func bfs_findingSister3(_ start: Int) {
    var neededVisitQueue = [start]
    var index = 0
    minTimeArr[start] = 0

    while index < neededVisitQueue.count {
        let currentLocate = neededVisitQueue[index]

        //　最初にteleportを処理する
        let moveSelect = [currentLocate * 2, currentLocate - 1, currentLocate + 1]
        for i in 0..<moveSelect.count {
            let next = moveSelect[i]
            if next < 0 || next > 100000 {
                continue
            }

            if i == moveSelect.startIndex {
                if minTimeArr[next] == -1 {
                    minTimeArr[next] = minTimeArr[currentLocate]
                    neededVisitQueue.append(next)
                }
            } else {
                if minTimeArr[next] == -1 {
                    // Not Visited Yet
                    minTimeArr[next] = minTimeArr[currentLocate] + 1
                    neededVisitQueue.append(next)
                }
            }

        }
        index += 1
    }
}

//BaekJoon n.13913(かくれんぼ4) 重要度: 🎖🎖🎖🎖🎖
// 🎖BFS
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (subin, sister) = (input[0], input[1])
var pathArr = Array(repeating: -1, count: 100001)

bfs_findingSister4(subin)

func bfs_findingSister4(_ start: Int) {
    var neededVisitQueue = [start]
    var index = 0
    pathArr[start] = 0
    
    while index < neededVisitQueue.count {
        let curLocate = neededVisitQueue[index]
        
        if curLocate == sister {
            var backTrackArray = [sister]
            var beforeLocate = sister
            
            while beforeLocate != start {
                backTrackArray.append(pathArr[beforeLocate])
                beforeLocate = pathArr[beforeLocate]
            }
            //　かかった時間の表示
            print(backTrackArray.count - 1)
            //　経路の表示
            print(backTrackArray.reversed().map { String($0) }.joined(separator: " "))
            return
        }
        
        for next in [curLocate - 1, curLocate + 1, curLocate * 2] {
            if next < 0 || next > 100000 {
                continue
            }
            
            if pathArr[next] == -1 {
                pathArr[next] = curLocate
                neededVisitQueue.append(next)
            }
        }
        
        index += 1
    }
}
