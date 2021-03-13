//
//  PersonImageTableViewCell.swift
//  CustomTableViewProject
//
//  Created by Yaroslav on 04.03.2021.
//

import UIKit

protocol PersonImageTableViewCellDelegate {
    func buttonPressed()
    func longButtonPressed()
}

class PersonImageTableViewCell: UITableViewCell {
    
    var longGesture = UILongPressGestureRecognizer()
    var delegate: PersonImageTableViewCellDelegate?
    
    
    // MARK: -  IBOutlet
    @IBOutlet weak var backroundImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var updateProfilePictureButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUserImage()
        setupUpdateProfilePictureButton()
        userImage.isUserInteractionEnabled = false
    }

    // MARK: - setup UI
    
    private func setupUserImage() {
        userImage.layer.cornerRadius = userImage.frame.height / 2
        userImage.layer.borderWidth = 2
        userImage.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func setupUpdateProfilePictureButton() {
        
        updateProfilePictureButton.backgroundColor = .clear
        updateProfilePictureButton.layer.cornerRadius = 20
        updateProfilePictureButton.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 18)
        updateProfilePictureButton.tintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        updateProfilePictureButton.setTitle("Update Profile Picture", for: .normal)
        updateProfilePictureButton.layer.borderWidth = 1
        updateProfilePictureButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
    }
    
    @objc func didLongPress(sender: UILongPressGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.began {
            delegate?.longButtonPressed()
        }
    }
    @IBAction func longPressButton(_ sender: UIButton) {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(didLongPress))
            self.addGestureRecognizer(longPress)
    }
    @IBAction func actionUpdateProfilePictureButton() {
        delegate?.buttonPressed()
    }
    
}



