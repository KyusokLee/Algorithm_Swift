//
//  miniMax_Sum(HackerRank).swift
//  Math_problem
//
//  Created by Kyus'lee on 2022/05/28.
//

import Foundation
//HackerRank
//🎖mini-maxSum
func mini_maxSum(arr: [Int]) -> Void {
    var result = ""
    let sortedArray = arr.sorted()
    var dp = Array(repeating: 0, count: sortedArray.count)
    dp[0] = sortedArray[0]
    
    for i in 1..<sortedArray.count {
        dp[i] = dp[i - 1] + sortedArray[i]
    }
    dp[4] -= dp[0]
    
    result += "\(dp[3]) \(dp[4])"
    print(result)
}

let inputArray = readLine()!.split(separator: " ").map { Int(String($0))! }
mini_maxSum(arr: inputArray)
