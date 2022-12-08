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

        // Do any additional setup after loading the view.
    }
    

    

}
