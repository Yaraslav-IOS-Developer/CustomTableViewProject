//
//  ProfileSettingsTableViewController.swift
//  CustomTableViewProject
//
//  Created by Yaroslav on 01.03.2021.
//

import UIKit


class ProfileSettingsTableViewController: UITableViewController {
    
   
    @IBOutlet weak var backroundImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var updateProfilePictureButton: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        imagePicker.delegate = self
        
        
        userImage.layer.cornerRadius = userImage.frame.height / 2
        userImage.layer.borderWidth = 2
        userImage.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        updateProfilePictureButton.backgroundColor = .clear
        updateProfilePictureButton.layer.cornerRadius = 20
        updateProfilePictureButton.layer.borderWidth = 1
        updateProfilePictureButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)

        
    }
    
    

    
    @IBAction func actionUpdateProfilePictureButton(_ sender: Any) {
        alertController()
    }
    @IBAction func longPressImageBackground(_ sender: UILongPressGestureRecognizer) {
        alertController()
    }
    
}

// MARK: - Table View Delegate
extension ProfileSettingsTableViewController  {

    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = #colorLiteral(red: 0.5362802744, green: 0.6920174956, blue: 0.8061967492, alpha: 1)
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .white
        header.textLabel?.font = UIFont(name: "Helvetica Neue", size: 14)
    }
}

// MARK: - Text field delegate

extension ProfileSettingsTableViewController: UITextFieldDelegate {
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}


// MARK: -  Work with image

extension ProfileSettingsTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
//    func chooseImagePicker(source: UIImagePickerController.SourceType) {
//
//        if UIImagePickerController.isSourceTypeAvailable(source) {
//            let imagePicker = UIImagePickerController()
//            imagePicker.delegate  = self
//            imagePicker.allowsEditing = true
//            imagePicker.sourceType = source
//            present(imagePicker, animated: true)
//        }
//    }
    
        

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            
            if  (image == backroundImage) {
                userImage.image = image
                userImage.contentMode = .scaleAspectFill
                userImage.clipsToBounds = true
                dismiss(animated: true)
            } else {
                backroundImage.image = image
                backroundImage.contentMode = .scaleAspectFill
                backroundImage.clipsToBounds = true
                dismiss(animated: true)
            }
            
            
        }
        
    }
}




