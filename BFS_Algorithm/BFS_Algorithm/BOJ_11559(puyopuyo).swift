//
//  File.swift
//  BFS_Algorithm
//
//  Created by Kyus'lee on 2022/05/20.
//

import Foundation
//BaekJoon n.11559 (Puyo Puyo) éè¦åº¦: ððððððððð
// ð¥ðBFS (HARD)
// R: Red, G: Green, B: Blue, P: Purple, Y: Yellow, "." : ç©º
// ç¾å¨ä¸ãããããã¼ã¿ã§ã®ç¶æ³ã ããèããã®ã§ãtempå¤æ°ã¯è¨­ããªãã¦ããã

typealias Locate = (row: Int, column: Int)
var map = [[Character]]()
let directionMove: [Locate] = [(0, 1), (0, -1), (1, 0), (-1, 0)] // æ±è¥¿åå
var comboCount = 0

//å¾ã«è¿½å ããåã¯,åã«å¥ããåããä¸ã«è¡ãããã«è¨­å®
for _ in 0..<12 {
    map.insert(Array(readLine()!), at: 0)
}

while true {
    var checked = Array(repeating: Array(repeating: false, count: 6), count: 12)
    var canCombo = false
    
    //ç¾å¨ã®ãã¼ã¿ã§é£éçã«comboãã§ããå ´æãå¨é¨æ¢ãä½æ¥­
    for i in 0..<12 {
        for j in 0..<6 {
            if map[i][j] != "." {
                //ç©ºãããªãå ´å è²ãæ¸ãã¦ããå ´åãcomboãã§ããããbfsæ¢ç´¢ã§æ¢ã
                if bfs_findingCombo(i, j, map[i][j], &checked) {
                    if !canCombo {
                        canCombo = true
                    }
                }
            }
        }
    }
    
    //ç¾å¨ã®ãã¼ã¿ã§comboãã§ããå ´æãå¨é¨æ¢ãã¦ããä»¥ä¸ã®æé ã«å¦çããã
    // if: ãããç¾å¨èª¿ã¹ãmapã§comboãçºçãããã¹ããªãå ´å -> break ãã¦whileææãåºã
    // else: comboãã§ããå ´æãããå ´å
    //     1. puyopuyo Map ã®ãã¼ã¿ãæ´æ°
    //     2. é£écount (comboCount)ãã+ 1ããä½æ¥­
    
    if !canCombo {
        break
    } else {
        puyopuyo_Renewal()
        comboCount += 1
    }
}

print(comboCount)

// comboãæ¢ã
func bfs_findingCombo(_ row: Int, _ column: Int, _ targetColor: Character, _ visited: inout [[Bool]]) -> Bool {
    var neededCheckQueue: [Locate] = [(row, column)]
    var index = 0
    var sameColorLength = 1
    visited[row][column] = true
    
    while index < neededCheckQueue.count {
        let (curRow, curColumn) = neededCheckQueue[index]
        
        for i in 0..<4 {
            let (nextRow, nextColumn) = (curRow + directionMove[i].row, curColumn + directionMove[i].column)
            
            if nextRow < 0 || nextRow >= 12 || nextColumn < 0 || nextColumn >= 6 || visited[nextRow][nextColumn] {
                continue
            }
            
            if map[nextRow][nextColumn] == targetColor {
                neededCheckQueue.append((nextRow, nextColumn))
                visited[nextRow][nextColumn] = true
                sameColorLength += 1
            }
        }
        
        index += 1
    }
    
    if sameColorLength >= 4 {
        // æ¢ç´¢ãå§ãããã¹ãã å³ãå·¦ãä¸ãä¸ã®æ¹åã«åãcolorã®æå­ãæ ¼ç´ããã¦ãããã¹ã4ã¤ä»¥ä¸ã§ããã° -> Is it combo? true!
        // comboã«ãªãã®ã¯ãèªæã§ããããmapã®å¤ã ç©º(".")ã«å¤æãã
        neededCheckQueue.forEach {
            map[$0.row][$0.column] = "."
        }
        return true
    } else {
        return false
    }
}

// puyopuyoã® mapãæ´æ°
// Tetrisã®ãããªä»çµã¿ã§æ´æ°ãã¦ãã
// foræã®é çªã«æ°ãã¤ãããã¨!
// ä¸ã®ããæå­ãæ¸ããã¦ãããã¹ãä¸çªä¸ã®è¡ã«è¡ãå¯è½æ§ãããã®ã§ãforæãï¼ã¤è¨­ãã
// ð¥row ãæåªå -> çç±: ãã®è¡ã®ä¸ã®ä¸ã¾ã§æ¢ã£ã¦æå­ãããã° ä¸ã®è¡ã«è½ã¨ããªãã¨ä¸çªä¸ã®è¡ã¾ã§å±ãããä¸­éã®ã©ã£ãã®è¡ã«çã¾ã£ã¦ãã¾ã
func puyopuyo_Renewal() {
    for column in 0..<6 {
        for belowRow in 0..<11 {
            for upperRow in belowRow + 1..<12 {
                if map[belowRow][column] == "." && map[upperRow][column] != "." {
                    map[belowRow][column] = map[upperRow][column]
                    map[upperRow][column] = "."
                    break
                    //breakããªãã¨ -> upperRowã¯ã10è¡ç®ãªã®ã«ãbelowRowã1è¡ç®ã«ãªã£ã¦ãã¾ããupperRowã®ï¼è¡ä¸ã®rowã®å¤å¥ãã§ããªããªã
                }
            }
        }
    }
}
