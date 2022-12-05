//
//  Move.swift
//  Final Project Program
//
//  Created by JAXON SCHRAUT on 12/5/22.
//

import Foundation
public class Move{
    
    var power: Double
    var type: typing
    enum typing{
        case water
        case fire
        case grass
        case electric
        case ground
        case steel
        case rock
    }
    
    init(power: Double, type: typing) {
        self.power = power
        self.type = type
    }
}
