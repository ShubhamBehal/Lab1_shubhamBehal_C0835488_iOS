//
//  ScoreInfo.swift
//  ScoreInfo
//
//  Created by Shubham Behal on 17/01/22.
//  Copyright © 2022 mohammadkiani. All rights reserved.
//

import Foundation
import UIKit

struct ScoreInfo {
    var isCross : Bool = false
    var crossIds : [Int] = []
    var noughtsIds : [Int] = []
    var naughtScore : Int = 0
    var crossScore : Int = 0
    var drawCount : Int = 0
    var lastTurnButton : Int = -1
}
