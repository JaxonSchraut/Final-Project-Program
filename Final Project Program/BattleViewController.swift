//
//  BattleViewController.swift
//  Final Project Program
//
//  Created by JAXON SCHRAUT on 12/2/22.
//

import UIKit

class BattleViewController: UIViewController {

    var computerTeam = [Pokemon]()
    var team = [Pokemon]()
    var current = 0
    var currentComp = 0
    
    var isCompTurn = false
    var isPlayerTurn = true
    
    @IBOutlet weak var playerKillsLabel: UILabel!
    @IBOutlet weak var compKillsLabel: UILabel!
    @IBOutlet weak var playerActivePokemonImage: UIImageView!
    @IBOutlet weak var playerActivePokemonHPLabel: UILabel!
    @IBOutlet weak var compActivePokemonImage: UIImageView!
    @IBOutlet weak var compActivePokemonHPLabel: UILabel!
    @IBOutlet weak var annoucerLabel: UILabel!
    
    @IBOutlet weak var move1Button: UIButton!
    @IBOutlet weak var move2Button: UIButton!
    @IBOutlet weak var move3Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        playerActivePokemonImage.image = UIImage(named: team[current].imageFile)
        playerActivePokemonHPLabel.text = String(team[current].hp)
        compActivePokemonImage.image = UIImage(named: computerTeam[currentComp].imageFile)
        compActivePokemonHPLabel.text = String(computerTeam[currentComp].hp)
    }
    
    @IBAction func Move1Action(_ sender: UIButton) {
        
        if(isPlayerTurn) {
            
            var toDeal = computerTeam[currentComp].def - team[current].attack*(checkTypeResult(pokemon: team[current]))
            if toDeal > 0 {
                toDeal = 0
            }
            
            computerTeam[currentComp].hp += toDeal
            
            if computerTeam[currentComp].hp <= 0{
                if currentComp < 2{
                    currentComp += 1
                    compActivePokemonImage.image = UIImage(named: computerTeam[currentComp].imageFile)
                    compActivePokemonHPLabel.text = String(computerTeam[currentComp].hp)
                    annoucerLabel.text = "The special attack was lethal, The computer puts in \(computerTeam[currentComp].name)"
                }else{
                    compActivePokemonHPLabel.text = "0"
                    annoucerLabel.text = "You have knocked out the entire enemy team, Player Wins!"
                }
            } else{
                compActivePokemonHPLabel.text = "\(computerTeam[currentComp].hp)"
                if toDeal < 0{
                    annoucerLabel.text = "\(team[current].name) used thier special attack, it did \(-(toDeal)) damage!"
                }else{
                    annoucerLabel.text = "\(team[current].name) used thier special attack, it did 0 damage!"
                }
            }
            
        isPlayerTurn = false
        isCompTurn = true
        } else {
            annoucerLabel.text = "Computer must move before you move again"
        }
    }
    @IBAction func Move2Action(_ sender: UIButton) {
        let x = (team[current].attack * 20) / (computerTeam[currentComp].def)
            computerTeam[currentComp].hp =  computerTeam[currentComp].hp - x
            annoucerLabel.text = "\(team[current].name) struck \(computerTeam[currentComp].name) for \(x) damage!"
        compActivePokemonHPLabel.text = String(computerTeam[currentComp].hp)
        playerActivePokemonHPLabel.text = String(team[current].hp)
        if computerTeam[currentComp].hp <= 0{
            
            var displayString = "\(team[current].name) killed \(computerTeam[currentComp].name)!\n"
            currentComp += 1
            if currentComp < 3{
                compActivePokemonImage.image = UIImage(named: computerTeam[currentComp].imageFile)
                compActivePokemonHPLabel.text = String(computerTeam[currentComp].hp)
                displayString = displayString + "Computer swaps in \(computerTeam[currentComp].name)!"
            } else {
                displayString = displayString + "The entire enemy team has been defeated, you win!"
                compActivePokemonHPLabel.text = "0"
                currentComp -= 1
            }
            annoucerLabel.text = displayString
        }
    }
    
    @IBAction func Move3Action(_ sender: UIButton) {
        
        if(isPlayerTurn) {
            
            let x = (team[current].def / 4)
            team[current].hp += x
            if team[current].hp > team[current].maxHP{
                team[current].hp = team[current].maxHP
            }
            playerActivePokemonHPLabel.text = String(Int(team[current].hp))
            annoucerLabel.text = "\(team[current].name) healed for \(x) health"
            
            
            isCompTurn = true
            isPlayerTurn = false
        } else {
            annoucerLabel.text = "Computer must move before you move again"
        }
    }
    
    @IBAction func makeComputerMoveButton(_ sender: Any) {
        
        if(isCompTurn){
            
            let x = Int.random(in: 1...3)
            
            if x == 1 {
                
                var toDeal = team[current].def - computerTeam[currentComp].attack*(checkTypeResult(pokemon: team[currentComp]))
                if toDeal > 0 {
                    toDeal = 0
                }
                
                team[current].hp += toDeal
                
                if team[current].hp <= 0{
                    if current < 2{
                        current += 1
                        playerActivePokemonImage.image = UIImage(named: team[current].imageFile)
                        playerActivePokemonHPLabel.text = String(team[current].hp)
                        annoucerLabel.text = "The special attack was lethal, Your team puts in \(team[current].name)"
                    }else{
                        playerActivePokemonHPLabel.text = "0"
                        annoucerLabel.text = "The computer has knocked out your entire enemy team, Computer Wins!"
                    }
                } else{
                    playerActivePokemonHPLabel.text = "\(team[current].hp)"
                    if toDeal < 0{
                        annoucerLabel.text = "\(computerTeam[currentComp].name) used thier special attack, it did \(-(toDeal)) damage!"
                    }else{
                        annoucerLabel.text = "\(computerTeam[currentComp].name) used thier special attack, it did 0 damage!"
                    }
                }
                
            }
            
            if x == 2 {
                
                
                
            }
            
            if x == 3{
                var x = (computerTeam[currentComp].def / 4)
                computerTeam[currentComp].hp += x
                if computerTeam[currentComp].hp > computerTeam[currentComp].maxHP{
                    computerTeam[currentComp].hp = computerTeam[currentComp].maxHP
                }
                compActivePokemonHPLabel.text = String(Int(computerTeam[currentComp].hp))
                annoucerLabel.text = "\(computerTeam[currentComp].name) healed for \(x) health"
            }
            
            
            isPlayerTurn = true
            isCompTurn = false
        } else {
            annoucerLabel.text = "You must move before the computer moves again"
        }
        
    }
    
    func checkTypeResult(pokemon: Pokemon) -> Double{
        switch (pokemon.type) {
        case .fire:
            if(computerTeam[currentComp].type == .grass){
                return 1.5
            }
            if(computerTeam[currentComp].type == .steel){
                return 1.5
            }
            if(computerTeam[currentComp].type == .rock){
                return 0.5
            }
            if(computerTeam[currentComp].type == .water){
                return 0.5
            }
            return 1
        case .water:
            if(computerTeam[currentComp].type == .fire){
                return 1.5
            }
            if(computerTeam[currentComp].type == .ground){
                return 1.5
            }
            if(computerTeam[currentComp].type == .electric){
                return 0.5
            }
            if(computerTeam[currentComp].type == .grass){
                return 0.5
            }
            return 1
        case .grass:
            if(computerTeam[currentComp].type == .water){
                return 1.5
            }
            if(computerTeam[currentComp].type == .ground){
                return 1.5
            }
            if(computerTeam[currentComp].type == .steel){
                return 0.5
            }
            if(computerTeam[currentComp].type == .fire){
                return 0.5
            }
            return 1
        case .rock:
            if(computerTeam[currentComp].type == .fire){
                return 1.5
            }
            if(computerTeam[currentComp].type == .steel){
                return 0.5
            }
            return 1
        case .steel:
            if(computerTeam[currentComp].type == .rock){
                return 1.5
            }
            if(computerTeam[currentComp].type == .grass){
                return 1.5
            }
            if(computerTeam[currentComp].type == .ground){
                return 0.5
            }
            if(computerTeam[currentComp].type == .fire){
                return 0.5
            }
            return 1
        case .ground:
            if(computerTeam[currentComp].type == .electric){
                return 1.5
            }
            if(computerTeam[currentComp].type == .steel){
                return 1.5
            }
            if(computerTeam[currentComp].type == .grass){
                return 0.5
            }
            if(computerTeam[currentComp].type == .water){
                return 0.5
            }
            return 1
        case .electric:
            if(computerTeam[currentComp].type == .water){
                return 1.5
            }
            if(computerTeam[currentComp].type == .ground){
                return 0.5
            }
            return 1
        }
    }
    
}
