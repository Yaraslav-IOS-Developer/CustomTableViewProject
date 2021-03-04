//
//  UserInfoTableViewCell.swift
//  CustomTableViewProject
//
//  Created by Yaroslav on 03.03.2021.
//

import UIKit

class UserInfoTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var infoForUserLabel: UILabel!
    @IBOutlet weak var infoUserTextFild: UITextField!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.infoUserTextFild.delegate = self
    }

    
    
}
extension UserInfoTableViewCell: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
       // textField.resignFirstResponder()
        
       return true 
    }
   
}
