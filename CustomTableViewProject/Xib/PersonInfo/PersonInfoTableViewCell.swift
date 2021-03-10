//
//  PersonInfoTableViewCell.swift
//  CustomTableViewProject
//
//  Created by Yaroslav on 04.03.2021.
//

import UIKit

class PersonInfoTableViewCell: UITableViewCell  {
    
    
    @IBOutlet weak var infoForUserLabel: UILabel!
    @IBOutlet weak var infoUserTextFild: UITextField!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        infoUserTextFild.delegate = self
        infoUserTextFild.tag = 0
    }
}

extension PersonInfoTableViewCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
       
        
//        guard let nextFiel = self.superview?.viewWithTag(textField.tag + 1) else  {
//            textField.resignFirstResponder()
//            return false
//        }
//
//        nextFiel.becomeFirstResponder()
        return false
       
    }
}
