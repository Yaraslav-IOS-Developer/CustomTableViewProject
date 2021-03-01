//
//  TableViewController.swift
//  CustomTableViewProject
//
//  Created by Yaroslav on 01.03.2021.
//

import UIKit


class TableViewController: UITableViewController {
    
    @IBOutlet weak var mybutton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mybutton.backgroundColor = .clear
        mybutton.layer.cornerRadius = 20
        mybutton.layer.borderWidth = 1
        mybutton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
}

extension TableViewController {
    
    
    
    
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        
    
        view.tintColor = #colorLiteral(red: 0.5362802744, green: 0.6920174956, blue: 0.8061967492, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .white
        header.textLabel?.font = UIFont(name: "Helvetica Neue", size: 14)
       
        
    }
}
