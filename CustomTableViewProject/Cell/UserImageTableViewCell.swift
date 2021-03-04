//
//  UserImageTableViewCell.swift
//  CustomTableViewProject
//
//  Created by Yaroslav on 04.03.2021.
//

import UIKit

class UserImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backroundImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var updateProfilePictureButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUserImage()
        setupUpdateProfilePictureButton()
    }

    // MARK -  setup UI
    private func setupUserImage() {
        userImage.layer.cornerRadius = userImage.frame.height / 2
        userImage.layer.borderWidth = 2
        userImage.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    private func setupUpdateProfilePictureButton() {
        updateProfilePictureButton.backgroundColor = .clear
        updateProfilePictureButton.layer.cornerRadius = 20
        updateProfilePictureButton.layer.borderWidth = 1
        updateProfilePictureButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    
    
    
}

