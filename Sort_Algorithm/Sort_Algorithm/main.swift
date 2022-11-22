//
//  main.swift
//  Sort_Algorithm
//
//  Created by Kyus'lee on 2022/05/20.
//

import Foundation

//// arrayの確認練習
//var pracArray = [1, 3, 8, 9, 12, 2, 7, 13, 2]
//pracArray += [111]
//print(pracArray) //[1, 3, 8, 9, 12, 2, 7, 13, 2, 111]


//// Baekjoon 2750 数字ソート
//// 重複なしのソート
//let num = Int(readLine()!)!
//var set = Set<Int>()
//
//for _ in 0..<num {
//    let input = Int(readLine()!)!
//    set.insert(input)
//}
//
//for i in set.sorted() {
//    print(i)
//}
//
//// 重複をなくすextension　定義
//extension Sequence where Element: Hashable {
//    func uniqued() -> [Element] {
//        var set = Set<Element>()
//        return filter { set.insert($0).inserted }
//    }
//}

//// Baekjoon 10989 数字ソート3
//// 重複なしのソート
//
//import Foundation
//
//final class FileIO {
//    private let buffer:[UInt8]
//    private var index: Int = 0
//
//    init(fileHandle: FileHandle = FileHandle.standardInput) {
//
//        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
//    }
//
//    @inline(__always) private func read() -> UInt8 {
//        defer { index += 1 }
//
//        return buffer[index]
//    }
//
//    @inline(__always) func readInt() -> Int {
//            var sum = 0
//            var now = read()
//            var isPositive = true
//
//            while now == 10
//                || now == 32 { now = read() } // 공백과 줄바꿈 무시
//            if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
//            while now >= 48, now <= 57 {
//                sum = sum * 10 + Int(now-48)
//                now = read()
//            }
//
//            return sum * (isPositive ? 1:-1)
//        }
//}
//
//let file = FileIO()
//
//let N = file.readInt()
//var arr = Array(repeating:0,count:10001)
//
//for _ in 0 ..< N {
//    let i = file.readInt()
//    arr[i] += 1
//}
//
//var res = ""
//
//for i in 1...10000 {
//    res += String(repeating:"\(i)\n",count:arr[i])
//}
//print(res)

//// Baekjoon 10867 重複なしでソートせよ
//// 重複なしのソート
//let num = Int(readLine()!)!
//let numArr = readLine()!.split(separator: " ").map { Int(String($0))! }
//let numSet = Set<Int>(numArr).sorted()
//var result = ""
//
//for i in numSet {
//    result += "\(i) "
//}
//result.removeLast()
//print(result)

//// もっと早い方法
//let num = Int(readLine()!)!
//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//var numSet = Array(Set(input))
//var result = ""
//numSet.sort()
//
//for i in numSet {
//    result += "\(i) "
//}
//result.removeLast()
//print(result)

//// もっともっと早い方法
//let num = Int(readLine()!)!
//let input = readLine()!.split(separator: " ").map { Int(String($0))! }
//var numSet = Set(input).sorted()
//
//for i in numSet {
//    print(i, terminator: " ")
//}

// Baekjoon 1715 カードをソートせよ (難易度: 🔥🔥)
// 重複なしのソート
// 最小の比較回数を求める
// 最大、最小に関するものは、Heapを用いて解く場合が多い

public struct Heap<T> {
    private var nodes = [T]()
    private var orderCriteria: (T, T) -> Bool

    public init(sort: @escaping (T, T) -> Bool) {
        // 最大heapか、最小heapかの基準を定める
        self.orderCriteria = sort
    }

    public init(array: [T], sort: @escaping (T, T) -> Bool) {
        self.orderCriteria = sort
        configureHeap(from: array)
    }

    public var count: Int {
        return nodes.count
    }

    // ノードの頂点
    public func peek() -> T? {
        return nodes.first
    }

    // 挿入
    public mutating func insert(_ value: T) {
        nodes.append(value)
        shiftUp(nodes.count - 1)
    }

    // 除去
    public mutating func remove() -> T? {
        guard !nodes.isEmpty else {
            return nil
        }

        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }

    public mutating func remove(at index: Int) -> T? {
        guard index < nodes.count else { return nil }

        let lastIndex = nodes.count-1
        if index != lastIndex {
            nodes.swapAt(index, lastIndex)
            shiftDown(from: index, until: lastIndex)
            shiftUp(index)
        }

        return nodes.removeLast()
    }

    // 変数を直接変更しなければいけないので、mutating使用
    private mutating func configureHeap(from array: [T]) {
        nodes = array

        // Heap Treeで n / 2 - 1 は一層上の階層となる
        // shiftDownをしながら、席を決めるので、最後のleaf　ノードはいらない
        for i in stride(from: nodes.count / 2 - 1, through: 0, by: -1) {
            shiftDown(i)
        }
    }

    private func parentIndex(ofIndex i: Int) -> Int {
        return (i - 1) / 2
    }

    private func leftChildIndex(ofIndex i: Int) -> Int {
        return 2 * i + 1
    }

    private func rightChildIndex(ofIndex i: Int) -> Int {
        return 2 * i + 2
    }

    // shiftUpは、自分と親ノードを比較して、位置を変える
    private mutating func shiftUp(_ index: Int) {
        var childIndex = index
        let child = nodes[childIndex] // 처음에 노드를 저장해두고 인덱스를 구한 후 바꿔준다.
        var parentIndex = self.parentIndex(ofIndex: index)

        while childIndex > 0 && orderCriteria(child, nodes[parentIndex]) {
            nodes[childIndex] = nodes[parentIndex]
            childIndex = parentIndex
            parentIndex = self.parentIndex(ofIndex: childIndex)
        }

        nodes[childIndex] = child
    }

    // shiftDownは、left, rightの子ノードの中に、合致しているものがあれば、位置を変えながら底のノートまで降りていく
    private mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = self.leftChildIndex(ofIndex: index)
        let rightChildIndex = leftChildIndex + 1

        var first = index
        if leftChildIndex < endIndex && orderCriteria(nodes[leftChildIndex], nodes[first]) {
            first = leftChildIndex
        }
        if rightChildIndex < endIndex && orderCriteria(nodes[rightChildIndex], nodes[first]) {
            first = rightChildIndex
        }
        if first == index {
            return
        }

        nodes.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }

    private mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: nodes.count)
    }
}

let num = Int(readLine()!)!
var numArr = [Int]()
for _ in 0..<num {
    numArr.append(Int(readLine()!)!)
}

// MARK: 最小Heapでrootのノードを取るから、sortの基準は <にする
// MARK: 🔥左の子と右の子の違いはない (左の方が右よりも小さい数字であるTree とは違う)
var heap = Heap<Int>(array: numArr, sort: <)
print(heap)
// 最小の比較回数を求める
var cost = 0

while heap.count > 1 {
    let n1 = heap.remove()!
    let n2 = heap.remove()!

    cost += n1 + n2
    heap.insert(n1 + n2)
    print(heap)
}
print(heap)

print(cost)


//// もっと計算時間が早い方法
//struct MinHeap<T: Comparable> {
//    var heap: [T] = []
//
//    var isEmpty: Bool {
//        return heap.count <= 1 ? true : false
//    }
//
//    init() {}
//    init(_ element: T) {
//        heap.append(element) // 0番index nodeを占めるため
//        heap.append(element) // 実際のroot nodeを入れる
//    }
//
//    mutating func insert(_ element: T) {
//        if heap.isEmpty {
//            heap.append(element)
//            heap.append(element)
//            return
//        }
//        heap.append(element)
//
//        func isMoveUp(_ insertIndex: Int) -> Bool {
//            if insertIndex <= 1 {
//                // Root Nodeの場合
//                return false
//            }
//            let parentIndex = insertIndex / 2
//            return heap[insertIndex] < heap[parentIndex] ? true : false
//        }
//
//        var insertIndex = heap.count - 1
//        while isMoveUp(insertIndex) {
//            let parentIndex = insertIndex / 2
//            heap.swapAt(insertIndex, parentIndex)
//            insertIndex = parentIndex
//        }
//    }
//
//    enum moveDownStatus { case left, right, none }
//
//    mutating func pop() -> T? {
//        if heap.count <= 1 {
//            return nil
//        }
//        let returnData = heap[1]
//        heap.swapAt(1, heap.count - 1)
//        heap.removeLast()
//
//        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
//            let leftChildIndex = poppedIndex * 2
//            let rightChildIndex = leftChildIndex + 1
//
//            // case1. 모든(왼쪽) 자식 노드가 없는 경우(완전이진트리는 왼쪽부터 채워지므로)
//            if leftChildIndex >= heap.count {
//                return .none
//            }
//
//            // case2. 왼쪽 자식 노드만 있는 경우
//            if rightChildIndex >= heap.count {
//                return heap[leftChildIndex] < heap[poppedIndex] ? .left : .none
//            }
//
//            // case3. 왼쪽&오른쪽 자식 노드 모두 있는 경우
//            // case3-1. 자식들이 자신보다 모두 큰 경우(자신이 제일 작은 경우)
//            if (heap[leftChildIndex] > heap[poppedIndex]) && (heap[rightChildIndex] > heap[poppedIndex]) {
//                return .none
//            }
//
//            // case3-2. 자식들이 자신보다 모두 작은 경우(왼쪽과 오른쪽 자식 중, 더 작은 자식을 선별)
//            if (heap[leftChildIndex] < heap[poppedIndex]) && (heap[rightChildIndex] < heap[poppedIndex]) {
//                return heap[leftChildIndex] < heap[rightChildIndex] ? .left : .right
//            }
//
//            // case3-3. 왼쪽과 오른쪽 자식 중, 한 자식만 자신보다 작은 경우
//            if (heap[leftChildIndex] < heap[poppedIndex]) || (heap[rightChildIndex] < heap[poppedIndex]) {
//                return heap[leftChildIndex] < heap[rightChildIndex] ? .left : .right
//            }
//
//            return .none
//        }
//
//        var poppedIndex = 1
//        while true {
//            switch moveDown(poppedIndex) {
//            case .none:
//                return returnData
//            case .left:
//                let leftChildIndex = poppedIndex * 2
//                heap.swapAt(poppedIndex, leftChildIndex)
//                poppedIndex = leftChildIndex
//            case .right:
//                let rightChildIndex = (poppedIndex * 2) + 1
//                heap.swapAt(poppedIndex, rightChildIndex)
//                poppedIndex = rightChildIndex
//            }
//        }
//    }
//}
//
//// main
//let num = Int(readLine()!)!
//var myMinHeap: MinHeap<Int> = MinHeap()
//
//for _ in 0..<num {
//    let input = Int(readLine()!)!
//    myMinHeap.insert(input)
//}
//
//var result: Int = 0
//for _ in 0..<num - 1 {
//    let first = myMinHeap.pop()!
//    let second = myMinHeap.pop()!
//    let temp = first + second
//    result += temp
//    myMinHeap.insert(temp)
//}
//
//print(result)
