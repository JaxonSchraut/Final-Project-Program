//
//  StatsViewController.swift
//  Final Project Program
//
//  Created by JAXON SCHRAUT on 12/2/22.
//

import UIKit

class StatsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! StatsTableViewCell
        
        
        
        return cell
    }
}
