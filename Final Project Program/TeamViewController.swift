//
//  TeamViewController.swift
//  Final Project Program
//
//  Created by JAXON SCHRAUT on 12/2/22.
//

import UIKit

class TeamViewController: UIViewController {

    /*image format:
     1 2 3
     4 5 6
     7 8 9*/
    @IBOutlet weak var pokemonImage1: UIImageView!
    @IBOutlet weak var pokemonImage2: UIImageView!
    @IBOutlet weak var pokemonImage3: UIImageView!
    @IBOutlet weak var pokemonImage4: UIImageView!
    @IBOutlet weak var pokemonImage5: UIImageView!
    @IBOutlet weak var pokemonImage6: UIImageView!
    @IBOutlet weak var pokemonImage7: UIImageView!
    @IBOutlet weak var pokemonImage8: UIImageView!
    @IBOutlet weak var pokemonImage9: UIImageView!
    @IBOutlet weak var selectionLabel: UILabel!
    @IBOutlet weak var refreshButton: UIButton!
    var allPokemon = [Pokemon]()
    var selectedToDisplay = [Pokemon]()
    var selected = [Pokemon(name: "", hp: 0, attack: 0, def: 0, type: .ground, imageFile: ""), Pokemon(name: "", hp: 0, attack: 0, def: 0, type: .ground, imageFile: ""), Pokemon(name: "", hp: 0, attack: 0, def: 0, type: .ground, imageFile: "")]
    var chosen = 0
    var randomComputerTeam = [Pokemon]()
    override func viewDidLoad() {
        super.viewDidLoad()
        allPokemon = [Pokemon(name: "Charizard", hp: 78, attack: 193, def: 163, type: .fire, imageFile: "charizard"), Pokemon(name: "Rapidash", hp: 65, attack: 180, def: 150, type: .fire, imageFile: "rapidash"),Pokemon(name: "Darmanitan", hp: 105, attack: 170, def: 110, type: .fire, imageFile: "darmanitan"),Pokemon(name: "Venusaur", hp: 80, attack: 182, def: 183, type: .grass, imageFile: "venusaur"),Pokemon(name: "Leavanny", hp: 75, attack: 173, def: 160, type: .grass, imageFile: "leavanny"),Pokemon(name: "Ludicolo", hp: 80, attack: 160, def: 170, type: .grass, imageFile: "ludicolo"),Pokemon(name: "Blastoise", hp: 79, attack: 168, def: 205, type: .water, imageFile: "blastoise"),Pokemon(name: "Wailord", hp: 170, attack: 180, def: 90, type: .water, imageFile: "wailord"),Pokemon(name: "Octillery", hp: 75, attack: 210, def: 150, type: .water, imageFile: "octilleruy"),Pokemon(name: "Aggron", hp: 70, attack: 170, def: 240, type: .rock, imageFile: "aggron"),Pokemon(name: "Barbaracle", hp: 72, attack: 159, def: 201, type: .rock, imageFile: "barbaracle"), Pokemon(name: "Rhydon", hp: 105, attack: 175, def: 165, type: .rock, imageFile: "rhydon"),Pokemon(name: "Empoleon", hp: 84, attack: 197, def: 189, type: .steel, imageFile: "empoleon"),Pokemon(name: "Scizor", hp: 70, attack: 185, def: 180, type: .steel, imageFile: "scizor"),Pokemon(name: "Klefki", hp: 58, attack: 162, def: 178, type: .steel, imageFile: "klefki"),Pokemon(name: "Raichu", hp: 60, attack: 180, def: 125, type: .electric, imageFile: "raichu"),Pokemon(name: "Jolteon", hp: 65, attack: 175, def: 155, type: .electric, imageFile: "jolteon"),Pokemon(name: "Ampharos", hp: 90, attack: 190, def: 175, type: .electric, imageFile: "ampharos"),Pokemon(name: "Swampert", hp: 100, attack: 195, def: 180, type: .ground, imageFile: "swampert"),Pokemon(name: "Nidoking", hp: 81, attack: 187, def: 152, type: .ground, imageFile: "nidoking"),Pokemon(name: "Gastrodon", hp: 111, attack: 175, def: 150, type: .ground, imageFile: "gastrodon")]
        selectionLabel.text = ""
        loadSelected()
        let x = Int.random(in: 0...20)
                var y = x
                var z = x
                while y == x{
                    y = Int.random(in: 0...20)
                }
                while z == x || z == y{
                    z = Int.random(in: 0...20)
                }
                randomComputerTeam.append(allPokemon[x])
                randomComputerTeam.append(allPokemon[y])
                randomComputerTeam.append(allPokemon[z])
    }
    
    func loadSelected(){
        var count = 0
        while count < 10 {
            let x = Int.random(in: 1..<allPokemon.count)
            selectedToDisplay.append(allPokemon.remove(at: x))
            count += 1
        }
        pokemonImage1.image = UIImage(named: selectedToDisplay[0].imageFile)
        pokemonImage2.image = UIImage(named: selectedToDisplay[1].imageFile)
        pokemonImage3.image = UIImage(named: selectedToDisplay[2].imageFile)
        pokemonImage4.image = UIImage(named: selectedToDisplay[3].imageFile)
        pokemonImage5.image = UIImage(named: selectedToDisplay[4].imageFile)
        pokemonImage6.image = UIImage(named: selectedToDisplay[5].imageFile)
        pokemonImage7.image = UIImage(named: selectedToDisplay[6].imageFile)
        pokemonImage8.image = UIImage(named: selectedToDisplay[7].imageFile)
        pokemonImage9.image = UIImage(named: selectedToDisplay[8].imageFile)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! BattleViewController
        nvc.team = selected
        nvc.computerTeam = randomComputerTeam
    }
   
    @IBAction func confirmAction(_ sender: UIButton) {
        performSegue(withIdentifier: "toBattleSegue", sender: self)
    }
    
    //all of the actions for choosing which pokemon you want
    /*button format:
    1 2 3
    4 5 6
    7 8 9               */
    @IBAction func choosePoke1(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[0].name || selected[1].name != selectedToDisplay[0].name || selected[2].name != selectedToDisplay[0].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[0]
                selectionLabel.text = "\(selected[0].name), \(selected[1].name), \(selected[2].name)"
                chosen += 1
            }
        }
    }
    @IBAction func choosePoke2(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[1].name || selected[1].name != selectedToDisplay[1].name || selected[2].name != selectedToDisplay[1].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[1]
                selectionLabel.text = "\(selected[0].name), \(selected[1].name), \(selected[2].name)"
                chosen += 1
            }
        }
    }
    @IBAction func choosePoke3(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[2].name || selected[1].name != selectedToDisplay[2].name || selected[2].name != selectedToDisplay[2].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[2]
                selectionLabel.text = "\(selected[0].name), \(selected[1].name), \(selected[2].name)"
                chosen += 1
            }
        }
    }
    @IBAction func choosePoke4(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[3].name || selected[1].name != selectedToDisplay[3].name || selected[2].name != selectedToDisplay[3].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[3]
                selectionLabel.text = "\(selected[0].name), \(selected[1].name), \(selected[2].name)"
                chosen += 1
            }
        }
    }
    @IBAction func choosePoke5(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[4].name || selected[1].name != selectedToDisplay[4].name || selected[2].name != selectedToDisplay[4].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[4]
                selectionLabel.text = "\(selected[0].name), \(selected[1].name), \(selected[2].name)"
                chosen += 1
            }
        }
    }
    @IBAction func choosePoke6(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[5].name || selected[1].name != selectedToDisplay[5].name || selected[2].name != selectedToDisplay[5].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[5]
                selectionLabel.text = "\(selected[0].name), \(selected[1].name), \(selected[2].name)"
                chosen += 1
            }
        }
    }
    @IBAction func choosePoke7(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[6].name || selected[1].name != selectedToDisplay[6].name || selected[2].name != selectedToDisplay[6].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[6]
                selectionLabel.text = "\(selected[0].name), \(selected[1].name), \(selected[2].name)"
                chosen += 1
            }
        }
    }
    @IBAction func choosePoke8(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[7].name || selected[1].name != selectedToDisplay[7].name || selected[2].name != selectedToDisplay[7].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[7]
                selectionLabel.text = "\(selected[0].name), \(selected[1].name), \(selected[2].name)"
                chosen += 1
            }
        }
    }
    @IBAction func choosePoke9(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[8].name || selected[1].name != selectedToDisplay[8].name || selected[2].name != selectedToDisplay[8].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[8]
                selectionLabel.text = "\(selected[0].name), \(selected[1].name), \(selected[2].name)"
                chosen += 1
            }
        }
    }
    
    
    
    @IBAction func refreshAction(_ sender: UIButton) {
        selectedToDisplay = [Pokemon]()
        loadSelected()
        refreshButton.isHidden = true
    }
    
    
}
