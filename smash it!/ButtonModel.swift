//
//  ButtonModel.swift
//  smash it!
//
//  Created by aurelia  natasha on 24/05/19.
//  Copyright © 2019 aurelia  natasha. All rights reserved.
//

import Foundation

class ButtonModel {
    var positionX: Int
    var positionY: Int
    var width : Int
    var height : Int
    var score : Int = 0
    var noClick : Int = 0
    
    init(x: Int, y: Int, w: Int, h: Int) {
        self.positionX = x
        self.positionY = y
        self.width = w
        self.height = h
    }
    
    func calculateScore(noClick : Int) -> Int{
        let random = Int.random(in: 5...14)
        score += noClick * random
        
        return score
    }
    
    func crackButton(){
        
    }
}
