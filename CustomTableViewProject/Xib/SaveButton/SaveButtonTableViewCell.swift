//
//  SaveButtonTableViewCell.swift
//  CustomTableViewProject
//
//  Created by Yaroslav on 10.03.2021.
//

import UIKit

class SaveButtonTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var saveUpdateButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupSaveUpdateButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    private func setupSaveUpdateButton() {
        
        saveUpdateButton.backgroundColor = #colorLiteral(red: 0.3139300048, green: 0.7033513188, blue: 0.9197835326, alpha: 1)
        saveUpdateButton.layer.cornerRadius = 20
        saveUpdateButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 20)
        saveUpdateButton.tintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        saveUpdateButton.setTitle("Save update", for: .normal)
        
        
        
    }
    
}
