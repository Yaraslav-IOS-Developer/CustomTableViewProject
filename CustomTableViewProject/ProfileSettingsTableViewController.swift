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
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var secondNameTextField: UITextField!
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var retypeNewPasswordTextFiel: UITextField!
    @IBOutlet weak var saveUpdateButton: UIButton!
    
    
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 1))
        imagePicker.delegate = self
        
        
        userImage.layer.cornerRadius = userImage.frame.height / 2
        userImage.layer.borderWidth = 2
        userImage.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        updateProfilePictureButton.backgroundColor = .clear
        updateProfilePictureButton.layer.cornerRadius = 20
        updateProfilePictureButton.layer.borderWidth = 1
        updateProfilePictureButton.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        saveUpdateButton.layer.cornerRadius = 20
    }
    
    var ceckImage = false
    @IBAction func actionUpdateProfilePictureButton() {
        //alertController()
        ceckImage = true
    }
    
    @IBAction func actionLongPressBackgroundImage(_ sender: UILongPressGestureRecognizer) {
        //alertController()
        ceckImage = false
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
        
        switch textField {
        case firstNameTextField:
            secondNameTextField.becomeFirstResponder()
        case secondNameTextField:
            mobileNumberTextField.becomeFirstResponder()
        case mobileNumberTextField:
            emailAddressTextField.becomeFirstResponder()
        case emailAddressTextField:
            newPasswordTextField.becomeFirstResponder()
        case newPasswordTextField:
            retypeNewPasswordTextFiel.becomeFirstResponder()
        default:
            break
        }
        
        return true
    }
    
}


// MARK: -  Work with image

extension ProfileSettingsTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            
            if  ceckImage  {
                userImage.image = image
                userImage.contentMode = .scaleAspectFill
                userImage.clipsToBounds = true
                dismiss(animated: true)
                print(userImage.tag)
            } else  {
                backroundImage.image = image
                backroundImage.contentMode = .scaleAspectFill
                backroundImage.clipsToBounds = true
                dismiss(animated: true)
                print(backroundImage.tag)
            }
            
        }
        
    }
}




