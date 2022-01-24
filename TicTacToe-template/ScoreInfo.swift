//
//  ScoreInfo.swift
//  ScoreInfo
//
//  Created by Shubham Behal on 17/01/22.
//  Copyright © 2022 mohammadkiani. All rights reserved.
//

import Foundation
import UIKit

struct ScoreInfo{
    var isCross = false
    var crossIds : [Int] = []
    var noughtsIds : [Int] = []
    var naughtScore = 0
    var crossScore = 0
    var drawCount = 0
    var lastTurnButton : UIButton? = nil
}
