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
    var allPokemon = [Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>), Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>), Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>),Pokemon(name: <#T##String#>, hp: <#T##Double#>, attack: <#T##Double#>, def: <#T##Double#>, type: <#T##Pokemon.typing#>, imageFile: <#T##String#>)]
    var selectedToDisplay = [Pokemon]()
    var selected = [Pokemon]()
    var chosen = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectionLabel.text = ""
    }
    
    func loadSelected(){
        var count = 0
        while count < 10 {
            selectedToDisplay.append(allPokemon[Int.random(in: 1..<allPokemon.count)])
            count += 1
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! BattleViewController
        nvc.team = selected
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
                selectionLabel.text = "\(selected)"
                chosen += 1
            }
        }
    }
    @IBAction func choosePoke2(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[1].name || selected[1].name != selectedToDisplay[1].name || selected[2].name != selectedToDisplay[1].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[1]
                selectionLabel.text = "\(selected)"
                chosen += 1
            }
        }
    }
    @IBAction func choosePoke3(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[2].name || selected[1].name != selectedToDisplay[2].name || selected[2].name != selectedToDisplay[2].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[2]
                selectionLabel.text = "\(selected)"
                chosen += 1
            }
        }
    }
    @IBAction func choosePoke4(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[3].name || selected[1].name != selectedToDisplay[3].name || selected[2].name != selectedToDisplay[3].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[3]
                selectionLabel.text = "\(selected)"
                chosen += 1
            }
        }
    }
    @IBAction func choosePoke5(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[4].name || selected[1].name != selectedToDisplay[4].name || selected[2].name != selectedToDisplay[4].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[4]
                selectionLabel.text = "\(selected)"
                chosen += 1
            }
        }
    }
    @IBAction func choosePoke6(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[5].name || selected[1].name != selectedToDisplay[5].name || selected[2].name != selectedToDisplay[5].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[5]
                selectionLabel.text = "\(selected)"
                chosen += 1
            }
        }
    }
    @IBAction func choosePoke7(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[6].name || selected[1].name != selectedToDisplay[6].name || selected[2].name != selectedToDisplay[6].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[6]
                selectionLabel.text = "\(selected)"
                chosen += 1
            }
        }
    }
    @IBAction func choosePoke8(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[7].name || selected[1].name != selectedToDisplay[7].name || selected[2].name != selectedToDisplay[7].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[7]
                selectionLabel.text = "\(selected)"
                chosen += 1
            }
        }
    }
    @IBAction func choosePoke9(_ sender: UIButton) {
        if selected[0].name != selectedToDisplay[8].name || selected[1].name != selectedToDisplay[8].name || selected[2].name != selectedToDisplay[8].name{
            if chosen < 3{
                selected[chosen] = selectedToDisplay[8]
                selectionLabel.text = "\(selected)"
                chosen += 1
            }
        }
    }
    
    
    
    
    
}
