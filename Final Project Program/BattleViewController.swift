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
    
    @IBOutlet weak var move1Button: UIButton!
    @IBOutlet weak var move2Button: UIButton!
    @IBOutlet weak var move3Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        playerActivePokemonImage.image = UIImage(named: team[current].imageFile)
        playerActivePokemonHPLabel.text = String(team[current].hp)
        compActivePokemonImage.image = UIImage(named: computerTeam[currentComp].imageFile)
        compActivePokemonHPLabel.text = String(computerTeam[currentComp].hp)
    }
    
    @IBAction func Move1Action(_ sender: UIButton) {
        
    }
    @IBAction func Move2Action(_ sender: UIButton) {
        
    }
    
    @IBAction func Move3Action(_ sender: UIButton) {
    }
    
}
