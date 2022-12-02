//
//  SwitchViewController.swift
//  Final Project Program
//
//  Created by JAXON SCHRAUT on 12/2/22.
//

import UIKit

class SwitchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") as! SwitchTableViewCell
        
        
        
        return cell
    }


}
