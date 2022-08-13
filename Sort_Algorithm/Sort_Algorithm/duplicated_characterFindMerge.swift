//
//  duplicated_characterFindMerge.swift
//  Sort_Algorithm
//
//  Created by Kyus'lee on 2022/08/13.
//

import Foundation
let input = readLine()!

print(duplicateFindMerge(input))

func duplicateFindMerge(_ str: String) -> String {
    var targetStr = str

    while true {
        if targetStr.isEmpty || targetStr.count == 1 || targetStr.count == 2 {
            break
        }

        let targetArray = targetStr.map { String($0) }
        var visited = Array(repeating: true, count: targetArray.count)

        for i in 1..<targetArray.count {
            for j in i - 1..<i {
                if targetArray[i] == targetArray[j] {
                    if visited[i] {
                        visited[i] = false
                        visited[j] = false
                        break
                    }
                }
            }
        }

        let filteredStr = targetArray.enumerated().filter { visited[$0.0] == true }.map { String($0.1) }
        targetStr = filteredStr.joined(separator: "")
    }

    if targetStr.count == 2 && (targetStr.first! == targetStr.last!) {
        targetStr = ""
    }

    return targetStr
}
