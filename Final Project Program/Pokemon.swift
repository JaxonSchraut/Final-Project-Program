//
//  Pokemon.swift
//  Final Project Program
//
//  Created by JAXON SCHRAUT on 12/5/22.
//

import Foundation
public class Pokemon{
    
    var name: String
    var hp: Double
    var attack: Double
    var def: Double
    var type: typing
    var imageFile: String
    var maxHP: Double
    
    enum typing{
        case water
        case fire
        case grass
        case electric
        case ground
        case steel
        case rock
    }
    
    init(name: String, hp: Double, attack: Double, def: Double, type: typing, imageFile: String) {
        self.name = name
        self.hp = hp
        self.attack = attack
        self.def = def
        self.type = type
        self.imageFile = imageFile
        maxHP = hp
    }
    
}
