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
    }
    @IBAction func Move2Action(_ sender: UIButton) {
        let x = (team[current].attack * 0.9) / (computerTeam[currentComp].def * 0.6)
        if (computerTeam[currentComp].hp) - x > 0 &&  x > 5{
            computerTeam[currentComp].hp =  computerTeam[currentComp].hp - x
            annoucerLabel.text = "\(team[current].name) struck \(computerTeam[currentComp].name) for \(x) damage!"
        } else {
            computerTeam[currentComp].hp -= 5
            annoucerLabel.text = "\(team[current].name) struck \(computerTeam[currentComp].name) for 5 damage!"
        }
        compActivePokemonHPLabel.text = String(Int(computerTeam[currentComp].hp))
        playerActivePokemonHPLabel.text = String(Int(team[current].hp))
    }
    
    @IBAction func Move3Action(_ sender: UIButton) {
        var x = (team[current].def / 4)
        team[current].hp += x
        if team[current].hp > team[current].maxHP{
            team[current].hp = team[current].maxHP
        }
        playerActivePokemonHPLabel.text = String(Int(team[current].hp))
        annoucerLabel.text = "\(team[current].name) healed for \(x) health"
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
