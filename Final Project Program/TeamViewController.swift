//
//  TeamViewController.swift
//  Final Project Program
//
//  Created by JAXON SCHRAUT on 12/2/22.
//

import UIKit

class TeamViewController: UIViewController {

    /* image format:
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
    /* image format:
     1 2 3
     4 5 6
     7 8 9*/
    
    @IBOutlet weak var selectionLabel: UILabel!
    var allPokemon = [Pokemon]()
    var selectedToDisplay = [Pokemon]()
    var selected = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectionLabel.text = ""
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue
        // Pass the selected object to the new view controller.
    }
   

}
